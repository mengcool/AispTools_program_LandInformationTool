;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<

;;;宗地转换功能实现 代码区域

;;;<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; static variable 静态变量
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

(setq StaticSelectDJQY nil)	;;;用于获取 AispTools_ZJ/SelectDJQY  窗体 用户选择数据



(regapp "QHDM")


;;;函数名称: c:QLR_Check
;;;接受参数:
;;;返回值:
;;;检查需要处理的复合线范围内:权利人是否唯一,姓名是否符合要求,不符合要求,加以标注
;;;需要调用到整个图形视窗
;;; successful 值表示 nil 程序错误 0 存在错误 1 无错误 2 警告
(defun c:QLR_Check (/ old_ss	 temp_3	    old_name   all_ss
		      temp_1	 ename	    temp_2     ss
		      name	 ls	    str_num    str
		      str_ls	 successful qlrLayer   qsxLayer
		      centralPoint	    flag1      flag2
		      acadObj	 total	    ZHFlag
		     )
  (setq acadObj (vlax-get-acad-object))
  (vla-ZoomAll acadObj)
  (setq	qlrLayer (dcl-Control-GetText
		   AispTools_ZJ/MainFrame/Frame1_ComboBox1
		 )
  )
;;;获取权利人图层
  (setq	qsxLayer (dcl-Control-GetText
		   AispTools_ZJ/MainFrame/Frame1_ComboBox2
		 )
  )
;;;获取权属线图层
  (cond
    ((= qlrLayer "")
     (dcl-messagebox "请设置权利人图层!" "Error:")
     (exit)
    )
    ((= qsxLayer "")
     (dcl-messagebox "请设置权属线图层!" "Error:")
     (exit)
    )
  )

  ;;;判断是否应该执行权利人检查
  (setq QSXFlag (dcl-Control-GetPicture AispTools_ZJ/MainFrame/QSXPictureBox))
  (cond
    ((= QSXFlag 100)
      (dcl-messagebox "请更正权属线的的错误!" "Error:")
      (exit)
    )
    ((= QSXFlag 101)
      (dcl-messagebox "请先执行权属线属性检查!!" "Error:")
      (exit)
    )
  )
  
  (if (setq old_ss (ssget "X"
			  (list
			    '(-4 . "<OR")
			    '(8 . "Aisp_Error")
			    '(8 . "qlrLayer")
;;;删除前一次检查内容,方便查阅
			    '(-4 . "OR>")
			  )
		   )
      )
    (progn
      (setq temp_3 0)
      (repeat (sslength old_ss)
	(setq old_name (ssname old_ss temp_3))
	(setq temp_3 (1+ temp_3))
	(entdel old_name)
      )
    )
  )

  (setq textstyle (getvar "TEXTSTYLE"))
;;;获取当前字体
  (setq successful nil flag1 0 flag2 0) ;;; 错误标识
  (setq	all_ss (ssget "X"
		      (list
			(cons 8 qsxLayer)
		      )
	       )
  )
  (if all_ss
    (progn
      (setq temp_1 0)
      
      (dcl-Form-Show AispTools_ZJ/ProgressBarDialog)  ;;;进度条控制
      (setq total (sslength all_ss))
      
      (dcl-Control-SetMaxValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 total)  ;;;进度条控制
      (repeat total
	(setq ename (ssname all_ss temp_1))
	(setq temp_1 (1+ temp_1))
	
	(dcl-Control-SetValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 temp_1) ;;;进度条控制

	(Aisp-ZoomObject (vlax-ename->vla-object ename)) ;;;缩放到权属线
	(setq coor (Aisp-get-coordinate ename))	;;;获取权属线端点坐标
	(setq centralPoint (AISP-GET-REGION-CENTROID (vlax-ename->vla-object ename)))	;;;获取权属线中心点
	(setq ss (ssget "CP" coor (list (cons 8 qlrLayer))))
	(if ss
	  (progn
	    (setq temp_2 0)
	    (setq str_num 0)
	    (repeat (sslength ss)
	      (setq name (ssname ss temp_2))
	      (setq temp_2 (1+ temp_2))
	      (setq ls (entget name))
	      (if (and (= (cdr (assoc 8 ls)) qlrLayer)
		       (= (cdr (assoc 0 ls)) "TEXT")
		  )
		(progn
		  (setq str_num (1+ str_num))
		  (setq str (cdr (assoc 1 ls)))
		  (setq ZHFlag (WCMATCH str "[0-9][0-9]*"))
		  (setq str (VL-CATCH-ALL-APPLY 'Aisp-get-Chinese (list str)))	 	  
;;;提取FWZJD图层文字中文字符
		)
	      )
	    )
	    (if	(and (/= str "") (/= ZHFlag nil))
	      (if (or (/= (rem (strlen str) 2) 0) (> (strlen str) 6))
;;;有一定概率出现权利人姓名提取有误,此处加以判断保护
		(progn
		  (Aisp-Error-Label centralPoint "权利人姓名可能存在错误!")
		  (setq flag1 (1+ flag1))
		  (entmake (list
				 '(0 . "TEXT")
				 '(8 . "qlrLayer")
				 '(40 . 0.15)
				 '(62 . 3)
				 (cons 1 str)
				 (cons 7 textstyle)
				 (cons 10 centralPoint)
			       )
		      )
		)
		(progn
		  (if (= str_num 1)
;;;权利人第一次出现才添加"权利人"文字
		    (progn
		      (entmake (list
				 '(0 . "TEXT")
				 '(8 . "qlrLayer")
				 '(40 . 0.15)
				 '(62 . 3)
				 (cons 1 str)
				 (cons 7 textstyle)
				 (cons 10 centralPoint)
			       )
		      )
		    )
		    (progn
		      (Aisp-Error-Label centralPoint "权属线内权利人姓名不唯一!")
		      (setq flag2 (1+ flag2))
		    )
		  )
		)
	      )
	      (progn
		(Aisp-Error-Label centralPoint "权利人姓名不完整!")
		(setq flag2 (1+ flag2))
	      )
	    )
	  )
	  (progn
	    (Aisp-Error-Label centralPoint "权属线内权利人姓名缺失!")
	    (setq flag2 (1+ flag2))
	  )
	)
      )
      (dcl-Form-Close AispTools_ZJ/ProgressBarDialog)
    )
    (progn
      (dcl-messagebox
	"权属线图层为空!!"
	"Error:"
      )
      (exit)
;;;致命错误,强制退出
    )
  )
  (cond
    (
     (and (/= flag1 0) (= flag2 0))
     (setq successful T)
     (dcl-Control-SetPicture AispTools_ZJ/MainFrame/QLRPictureBox 103) ;;;设置警告
     (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox ">>>Warning:存在可能错误的权利人姓名,\r\n 请仔细核对,可继续执行下一步!")
    )
    (
     (/= flag2 0)
     (setq successful nil)
     (dcl-Control-SetPicture AispTools_ZJ/MainFrame/QLRPictureBox 100) ;;;设置未通过图标
     (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox ">>>Error:权利人检查未通过,\r\n 请更正(图层:Aisp_Error)标注的错误!")
    )
    (
     (and (= flag1 0) (= flag2 0))
     (setq successful T)
     (dcl-Control-SetPicture AispTools_ZJ/MainFrame/QLRPictureBox 102) ;;;设置通过图标
     (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox ">>>权利人检查通过,\r\n 请继续执行下一步操作!")
    )
  )
  (gc)
)


;;;函数名称: c:QSX_Check
;;;接受参数:
;;;返回值:
;;;功能: 检查权属线是否存在拓扑问题
;;;需要调用到整个图形视窗
(defun c:QSX_Check (/ qlrLayer	  qsxLayer    acadObj	  old_ss
		      temp_3	  old_name    successful  all_ss
		      counter	  flag	      vlaObject	  acadObj total
		     )
  (setq acadObj (vlax-get-acad-object))
  (vla-ZoomAll acadObj)
  
  (setq	qlrLayer (dcl-Control-GetText
		   AispTools_ZJ/MainFrame/Frame1_ComboBox1
		 )
  )
;;;获取权利人图层
  (setq	qsxLayer (dcl-Control-GetText
		   AispTools_ZJ/MainFrame/Frame1_ComboBox2
		 )
  )
;;;获取权属线图层
  (cond
    ((= qlrLayer "")
     (dcl-messagebox "请设置权利人图层!" "Error:")
     (exit)
    )
    ((= qsxLayer "")
     (dcl-messagebox "请设置权属线图层!" "Error:")
     (exit)
    )
  )

  (if (setq old_ss (ssget "X"
			  (list
			    '(-4 . "<OR")
			    '(8 . "Aisp_Error")
;;;删除前一次检查内容,方便查阅
			    '(-4 . "OR>")
			  )
		   )
      )
    (progn
      (setq temp_3 0)
      (repeat (sslength old_ss)
	(setq old_name (ssname old_ss temp_3))
	(setq temp_3 (1+ temp_3))
	(entdel old_name)
      )
    )
  )

  (setq successful nil flag 0)
  (setq	all_ss (ssget "X"
		      (list
			  '(0 . "LWPOLYLINE")
			   (cons 8 qsxLayer)
		      )
	       )
  )
  (if all_ss
    (progn
      (setq counter 0)
      (dcl-Form-Show AispTools_ZJ/ProgressBarDialog)  ;;;进度条控制
      
      (setq total (sslength all_ss))

      (dcl-Control-SetMaxValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 total)  ;;;进度条控制
      (repeat total
	(setq vlaObject (vlax-ename->vla-object (ssname all_ss counter)))
	(setq counter (1+ counter))
	
	(dcl-Control-SetValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 counter) ;;;进度条控制
	
	(if (not (Aisp-Check-PolylineTopology vlaObject))
	  (progn
	    (setq flag (1+ flag))
	  )
	)
      )
      (dcl-Form-Close AispTools_ZJ/ProgressBarDialog)
    )
    (progn
      (dcl-messagebox "权属线图层为空!" "Error:")
      (exit)
    )
  )
  
  (if (= flag 0)
    (progn
      (dcl-Control-SetPicture AispTools_ZJ/MainFrame/QSXPictureBox 102) ;;;设置 通过 图标
      (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox ">>>权属线检查通过,\r\n 请继续执行下一步权利人检查")
    )
    (progn
      (dcl-Control-SetPicture AispTools_ZJ/MainFrame/QSXPictureBox 100) ;;;设置 未通过 图标
      (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox ">>>Error:权属线检查未通过,\r\n 请更正(图层:Aisp_Error)标注的错误!")
    )
  )
  
  (gc)
)


;;;函数名称: c:Aisp-ScopeToAddParcel
;;;接受参数:
;;;返回值:成功返回 T,否则返回 nil 
;;;内联函数: 
;;;功能: 
(defun c:Aisp-ScopeToAddParcel (/ successful	flag
				  djqy		qsxLayer
				  polylineObject
				  polylineCoord	acadObj
				  minExt	maxExt
				  selectWP selectCP	counter1
				  total		vlaName
				  objectHandle	crossEntityList
				 )
  (setq successful nil)
  (setq flag (dcl-Form-Show AispTools_ZJ/SelectDJQY))	;;;显示 选择地籍区域 窗体
  (cond
    (
     (= flag 3)
     (setq djqy StaticSelectDJQY)
    )
    (
     (or (= flag 1) (= flag 2))
     (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox "请选择添加的地籍区域!")
    )
  )
  (setq	qsxLayer (dcl-Control-GetText
		   AispTools_ZJ/MainFrame/Frame1_ComboBox2
		 )
  )
;;;获取权属线图层
  (if (and (/= qsxLayer "") (/= djqy nil) (/= djqy "尚未创建地籍区域"))
    (progn
      (if (setq	old_ss (ssget "X"
			      (list
				'(-4 . "<OR")
				'(8 . "Aisp_Error")
				
;;;删除前一次检查内容,方便查阅
				'
				 (-4 . "OR>")
			      )
		       )
	  )
	(progn
	  (setq temp_3 0)
	  (repeat (sslength old_ss)
	    (setq old_name (ssname old_ss temp_3))
	    (setq temp_3 (1+ temp_3))
	    (entdel old_name)
	  )
	)
      )
      (setq polylineObject
	     (vlax-ename->vla-object
	       (car (entsel "\n请选择范围线:"))
	     )
      )
      (if (/= polylineObject nil)
	(progn
	  (setq	polylineCoord
		 (Aisp-Get-AcDbPolyline-Coordinate
		   polylineObject
		 )
	  )
;;;获取范围线端点坐标

	  (setq acadObj (vlax-get-acad-object))
;;;调整到范围线视窗
	  (vla-GetBoundingBox polylineObject 'minExt 'maxExt)
	  (vla-ZoomWindow acadObj minExt maxExt)

	  (setq	selectWP (ssget "WP"
;;;在宗地号下方生成区号代码,地籍子区
			      polylineCoord
			      (list 
				    (cons 8 qsxLayer)
			      )
		       )
	  )
	  (setq	selectCP (ssget "CP"
;;;与地籍区域范围线交叉的对象
			      polylineCoord
			      (list 
				    (cons 8 qsxLayer)
			      )
		       )
	  )
	  (if (and (/= selectWP nil) (/= selectCP nil))
	    (progn
	      (setq crossEntityList nil)
	      (setq counter1 0)
	      (repeat (sslength selectCP)	;;;检查交叉实体
		(setq vlaName (vlax-ename->vla-object (ssname selectCP counter1)))
		(if (= "AcDbPolyline" (vlax-get-property vlaName 'ObjectName))
		  (progn
		    (setq objectHandle
			   (vlax-get-property vlaName 'Handle)
		    )
		    (setq crossEntityList
			   (cons objectHandle
				 crossEntityList
			   )
		    )
		  )
		)
		(setq counter1 (1+ counter1))
	      )
	      
	      (setq counter1 0)
	      (setq total (sslength selectWP))
	      (repeat total
		(setq vlaName (vlax-ename->vla-object (ssname selectWP counter1)))
		(setq counter1 (1+ counter1))
		(if (= "AcDbPolyline" (vlax-get-property vlaName 'ObjectName))
		  (progn
		    (setq objectHandle (vlax-get-property vlaName 'Handle))
		    (setq crossEntityList (VL-REMOVE-IF '(lambda (x) (= x objectHandle)) crossEntityList))	;;;检查交叉实体
		    (dcl-Tree-AddChild
		      AispTools_ZJ/MainFrame/AispTabStrip_Tree1
		      (List
			(list
			  djqy
			  objectHandle
			  objectHandle
			)
		      )
		    )
		  )
		)
	      )
	      (if (/= crossEntityList nil)	;;;对交叉宗地实体进行标注
		(progn
		  (foreach crossEntity crossEntityList
		    (setq centroid (AISP-GET-REGION-CENTROID (vlax-ename->vla-object (HANDENT crossEntity))))
		    (AISP-ERROR-LABEL centroid "与地籍区域交叉的宗地实体")
		  )
		)
              )
	      (setq successful T)
	    )
	    (progn
	      (dcl-messagebox "范围线内未找到符合要求的权属线,请确认是否选择正确" "Aisp提示")
	    )
	  )
	  
	)
      )
    )
    (progn
      (dcl-messagebox "请设置权属线图层与地籍区域!" "Aisp提示")
    )
  )
  
  (setq StaticSelectDJQY nil)
  successful
  (gc)
)

;;;函数名称: c:Aisp-SingleAddParcel
;;;接受参数: 
;;;返回值:成功返回 T,否则返回 nil 
;;;内联函数:
;;;功能: 单独添加宗地实体
(defun c:Aisp-SingleAddParcel (/ successful flag djqy qsxLayer polylineObject objectHandle)
  (setq successful nil)
  (setq flag (dcl-Form-Show AispTools_ZJ/SelectDJQY))	;;;显示 选择地籍区域 窗体
  (cond
    (
     (= flag 3)
     (setq djqy StaticSelectDJQY)
    )
    (
     (or (= flag 1) (= flag 2))
     (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox "请选择添加的地籍区域!")
    )
  )
  (setq	qsxLayer (dcl-Control-GetText
		   AispTools_ZJ/MainFrame/Frame1_ComboBox2
		 )
  )
;;;获取权属线图层
  (if (and (/= qsxLayer "") (/= djqy nil) (/= djqy "尚未创建地籍区域"))
    (progn
      (setq polylineObject
	     (vlax-ename->vla-object
	       (car (entsel "\n请选择单独的宗地实体:"))
	     )
      )
      (if (and
	    (= "AcDbPolyline"
	       (vlax-get-property polylineObject 'ObjectName)
	    )
	    (= qsxLayer
	       (vlax-get-property polylineObject 'Layer)
	    )
	  )
	(progn
	  (setq objectHandle (vlax-get-property polylineObject 'Handle))
	  (if (/= (dcl-Tree-AddChild
		     AispTools_ZJ/MainFrame/AispTabStrip_Tree1
		     (List
		       (list
			 djqy
			 objectHandle
			 objectHandle
		       )
		     )
		   )
		  0
	      )
	    (dcl-messagebox (strcat "已添加宗地实体到" djqy "地籍区域") "Aisp提示")
	    (dcl-messagebox "请不要添加重复的宗地实体!" "Aisp提示")
	  )
	)
	(progn
	  (dcl-messagebox "这并不是期望的宗地实体!" "Aisp提示")
	)
      )
    )
    (progn
      (dcl-messagebox "请设置权属线图层与地籍区域!" "Aisp提示")
    )
  )
  (setq StaticSelectDJQY nil)
  successful
  (gc)
  (princ)
)

;;;函数名称: c:Aisp-ParcelSort
;;;接受参数: 
;;;返回值:
;;;内联函数: 
;;;功能: 根据树形控件提供的信息,对宗地进行流水号编排
(defun c:Aisp-ParcelSort (/ old_ss	  temp_3	old_name
			    qlrLayer	  QSXFlag	QLRFlag
			    DJQYList	  matchList	acadObj
			    ProgressCounter		sortList
			    handleList	  QSXVlaName	QSXcoordLIst
			    QSXCentroidPt selectCP	qlrVlaName
			    ZHStr	  tempZHList	singleZHList
			    startNum	  counter2	ename
			    Ob_name	  old_str
			   )
  (if (setq old_ss (ssget "X"
			  (list
			    '(-4 . "<OR")
			    '(8 . "ParcelNumLayer")
;;;删除前一次检查内容,方便查阅
			    '(-4 . "OR>")
			  )
		   )
      )
    (progn
      (setq temp_3 0)
      (repeat (sslength old_ss)
	(setq old_name (ssname old_ss temp_3))
	(setq temp_3 (1+ temp_3))
	(entdel old_name)
      )
    )
  )
  (setq	qlrLayer (dcl-Control-GetText
		   AispTools_ZJ/MainFrame/Frame1_ComboBox1
		 )
  )
;;;获取权利人图层
  (setq QSXFlag (dcl-Control-GetPicture AispTools_ZJ/MainFrame/QSXPictureBox))	;;;判断权属线检查是否通过
  (setq QLRFlag (dcl-Control-GetPicture AispTools_ZJ/MainFrame/QLRPictureBox))	;;;判断权利人检查是否通过
  (if (and (/= QSXFlag 100) (/= QLRFlag 100) (/= QSXFlag 101) (/= QLRFlag 101) (/= qlrLayer ""))
    (progn
      (setq DJQYList (Aisp-GetStrcatLabelList "DJQY"))
      (setq matchList
	     (mapcar '(lambda (x)
			(dcl-Tree-GetFirstChildItem
			  AispTools_ZJ/MainFrame/AispTabStrip_Tree1
			  x
			)
		      )
		     DJQYList
	     )
      )		;;;检查是否存在尚未添加宗地实体的地籍区域
      (if (not (vl-remove-if-not '(lambda (x) (= x nil)) matchList))
	(progn
	  (setq acadObj (vlax-get-acad-object))
          (vla-ZoomAll acadObj)	;;;调整视口到全部

	  (dcl-Control-SetEnabled AispTools_ZJ/MainFrame/Tree1_End_Check T)	;;;设置 "转换前最后检查" 按钮为可用
	  
	  (dcl-Form-Show AispTools_ZJ/ProgressBarDialog)  ;;;进度条控制
	  (dcl-Control-SetMaxValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 (length DJQYList))  ;;;进度条控制
	  (setq ProgressCounter 0)

	  
	  (foreach DJQY DJQYList
	    (dcl-Control-SetValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 (setq ProgressCounter (1+ ProgressCounter))) ;;;进度条控制
	    (setq sortList nil)		;;;重置排序表为nil
	    (setq handleList (Aisp-GetStrcatLabelList DJQY))
	    
	    (foreach handle handleList
	      (setq QSXVlaName (vlax-ename->vla-object (handent handle)))
	      (AISP-ZOOMOBJECT QSXVlaName) ;;;缩放到权属线
	      (setq QSXcoordLIst (AISP-GET-ACDBPOLYLINE-COORDINATE QSXVlaName))	;;;获取权属线端点坐标
	      (setq QSXCentroidPt (AISP-GET-REGION-CENTROID QSXVlaName))	;;;获取权属线形心
	      (setq selectCP (ssget "CP" QSXcoordLIst (list (cons 8 qlrLayer))))
	      (setq qlrVlaName (vlax-ename->vla-object (ssname selectCP 0)))	;;;获取权利人
	      (setq ZHStr (VL-CATCH-ALL-APPLY 'vlax-get-property (list qlrVlaName 'TextString)))	;;;获取权利人所在组号
	      (if (not (VL-CATCH-ALL-ERROR-P ZHStr))
		(progn
		  (setq ZHStr (car (XD::String:RegExpS "[0-9][0-9]*" ZHStr "")))
		  (setq ZHStrCoord (list (car QSXCentroidPt)
					  (- (nth 1 QSXCentroidPt) 0.2)
				    ))
		   (setq ZHEnameList
			  (entmake (list
				     '(0 . "TEXT")
				     '(8 . "ParcelNumLayer")
				     '(40 . 0.15)
				     '(62 . 3)
				     (cons 1 ZHStr)
				     (cons 10
					   ZHStrCoord
				     );;;中心点下移0.2
				   )
			  )
		   )
		  (setq sortList (cons (list ZHStr (list (cdr (assoc 5 (entget (entlast)))) ZHStrCoord)) sortList))
		)
		(progn
		  (vla-put-ConstantWidth QSXVlaName 2)
		  (dcl-messagebox "c:Aisp-ParcelSort->ZHStr \n 异常" "Aisp提示")
		  (exit)
		)
              )
	    )

	    (setq ZHList nil)	;;;当前地籍区域的所有组号
	    (setq tempZHList (mapcar '(lambda (x) (car x)) sortList))
	    (foreach tempZH tempZHList
	      (if (not (VL-REMOVE-IF-NOT '(lambda (x) (= x tempZH)) ZHList))
		(setq ZHList (cons tempZH ZHList))
	      )
	    )

	    ;;;下面开始流水号编排
	    (foreach ZH	ZHList
	      (setq singleZHList
		     (VL-REMOVE-IF-NOT
		       '(lambda (x) (= (car x) ZH))
		       sortList
		     )
	      )
	      (setq singleZHList
		     (mapcar '(lambda (x) (cadr x))
			     singleZHList
		     )
	      )
	      (setq singleZHList
		     (vl-sort singleZHList
			      '(lambda (a1 a2)
				 (< (/ (fix (car (cadr a1))) 10)
				    (/ (fix (car (cadr a2))) 10)
				 )
			       )
		     )
	      )   ;;;从上到下,排序  (模糊排序)
	      (setq singleZHList
		     (vl-sort singleZHList
			      '(lambda (a1 a2)
				 (> (cadr (cadr a1)) (cadr (cadr a2)))
			       )
		     )
	      )  ;;;从左至右,排序 (精确排序)

	      (setq startNum (atoi (nth 2 (AISP-SEPARATOR-SUBSTR DJQY ","))))	;;;取得树形控件内的流水号
	      (setq counter2 0)
	      (repeat (length singleZHList)
		(cond	;;;处理流水号为字符串
		  (
		   (< STARTNUM 10)
		   (setq LXH (strcat "00" (rtos STARTNUM 2 0)))
		  )
		  (
		   (< STARTNUM 100)
		   (setq LXH (strcat "0" (rtos STARTNUM 2 0)))
		  )
		  (
		   (< STARTNUM 1000)
		   (setq LXH (rtos STARTNUM 2 0))
		  )
		)
		(setq ename (HANDENT (car (nth counter2 singleZHList))));;;句柄返回图元名
		(setq Ob_name (vlax-ename->vla-object ename));;;转换VLA对象
		(setq old_str (vla-get-TextString Ob_name))
		(vla-put-TextString Ob_name (strcat old_str LXH));;;更新对象文字内容
		(setq STARTNUM (1+ STARTNUM));;;流水号递增
		(setq counter2 (1+ counter2));;;计数器递增
	      )
	    )
	  )
	  (dcl-Form-Close AispTools_ZJ/ProgressBarDialog)
	)
	(progn
	  (dcl-messagebox "Warning:存在尚未添加宗地实体的地籍区域 \n       多余的地籍区域请删除" "Aisp提示")
	)
      )
    )
    (progn
      (dcl-messagebox "权属线或者权利人检查未通过!" "Aisp提示")
    )
  )
  (gc)
  (princ)
)

;;;函数名称: c:Aisp-LastCheck
;;;接受参数: 
;;;返回值:
;;;内联函数: 
;;;功能: 再一次检查属性内容是否合格
(defun c:Aisp-LastCheck (/ old_ss	 temp_3	       old_name
			   DJQYList	 allHandleList counter1
			   errorFlag	 handleList    acadObj
			   ProgressCounter	       qsxVlaName
			   centroid	 qsxSelectCP   counter2
			   qlrFlag	 ZDHFlag       CPVlaName
			   CPLayer
			  )
  (if (setq old_ss (ssget "X"
			  (list
			    '(-4 . "<OR")
			    '(8 . "Aisp_Error")
;;;删除前一次检查内容,方便查阅
			    '(-4 . "OR>")
			  )
		   )
      )
    (progn
      (setq temp_3 0)
      (repeat (sslength old_ss)
	(setq old_name (ssname old_ss temp_3))
	(setq temp_3 (1+ temp_3))
	(entdel old_name)
      )
    )
  )
  
  (setq DJQYList (Aisp-GetStrcatLabelList "DJQY"))	;;;获得树形控件下所有的地籍区域项
  (setq	allHandleList
	 (mapcar '(lambda (x)
		    (Aisp-GetStrcatLabelList x)
		  )
		 DJQYList
	 )
  )

  (setq counter1 0)
  (setq errorFlag 0)
  (repeat (length allHandleList)
    (setq handleList (nth counter1 allHandleList))
    (setq counter1 (1+ counter1))
    (if	(/= handleList nil)
      (progn
;;;	(setq acadObj (vlax-get-acad-object))
;;;        (vla-ZoomAll acadObj)	;;;调整视口到全部
	(dcl-Form-Show AispTools_ZJ/ProgressBarDialog)	;;;显示进度条

	(setq ProgressCounter 0)
	(foreach handleItem handleList
	  (dcl-Control-SetValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 (setq ProgressCounter (1+ ProgressCounter)))
	  
	  (setq	qsxVlaName
		 (vlax-ename->vla-object (handent handleItem))
	  )
	  (Aisp-ZoomObject qsxVlaName) ;;;缩放到权属线
	  (setq
	    qsxCoord (AISP-GET-ACDBPOLYLINE-COORDINATE qsxVlaName)
	  ) ;;;取得权属线端点坐标
	  (setq centroid (AISP-GET-REGION-CENTROID qsxVlaName))
	  (setq qsxSelectCP (ssget "CP" qsxCoord (list '(-4 . "<OR")
						       '(8 . "ParcelNumLayer")
						       '(8 . "qlrLayer")
						       '(-4 . "OR>")
						       )))
	  (if (/= qsxSelectCP nil)
	    (progn
	      (setq counter2 0)	;;; 判断权属线内的实体
	      (setq qlrFlag 0 ZDHFlag 0)	;;;设置出现次数为0
	      (repeat (sslength qsxSelectCP)
		(setq CPVlaName (vlax-ename->vla-object (ssname qsxSelectCP counter2)))
		(setq counter2 (1+ counter2))
		(setq CPLayer (vlax-get-property CPVlaName 'Layer))
		(cond
		  (
		   (= CPLayer "qlrLayer")
		   (setq qlrFlag (1+ qlrFlag))	;;;设置出现次数
		  )
		  (
		   (= CPLayer "ParcelNumLayer")
		   (setq ZDHFlag (1+ ZDHFlag))	;;;设置出现次数
		  )
		)
	      )
	      
	      (if (and (/= qlrFlag 1) (/= ZDHFlag 1))
		(progn
		  (AISP-ERROR-LABEL centroid "缺少宗地号或权利人!")
		  (setq errorFlag (1+ errorFlag))	;;;出现错误的次数
		)
	      )
	    )
	    (progn
	      (AISP-ERROR-LABEL centroid "缺少宗地号和权利人!")
	      (setq errorFlag (1+ errorFlag))	;;;出现错误的次数
	    )
	  )
	)
      )
    )
  )

  (dcl-Form-Close AispTools_ZJ/ProgressBarDialog)	;;;关闭进度条
  
  (if (= errorFlag 0)
    (progn
      (dcl-Control-SetEnabled AispTools_ZJ/MainFrame/Tree1_Transform T)	;;;没有错误设置"开始转换"按钮为可用
      (dcl-messagebox "属性合格" "Aisp提示")
    )
    (progn
      (dcl-messagebox "存在错误,请更正" "Aisp提示")
    )
  )

  (gc)
  (princ)
)


;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<

;;;子程序 代码区域

;;;<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;;;函数名称: Aisp-Check-PolylineTopology
;;;接受参数: vlaObject (多段线对象)
;;;返回值:成功返回 T,否则返回 nil 
;;;内联函数: Aisp-Error-Label AISP-GET-REGION-CENTROID Aisp-Get-AcDbPolyline-Coordinate
;;;功能: 检查多段线对象是否存在拓扑问题,对存在拓扑问题或未闭合的多段线进行标注,
(defun Aisp-Check-PolylineTopology (vlaObject / successful object_table MSpace indetermination coord)
  (setq successful nil)
  (setq repeatPoint nil)
  (if (= "AcDbPolyline" (vlax-get-property vlaObject 'ObjectName))
    (progn
      (setq coordList (Aisp-Get-AcDbPolyline-Coordinate vlaObject)) ;;;获取多段线端点坐标
      ;;;检查是否存在重复端点
      (foreach coord coordList
	(setq tempList (cdr (member coord coordList)))
	(if (member coord tempList)
	  (setq repeatPoint T)
	)
      )

      (if (/= (vla-get-elevation vlaObject) 0)	;;;设置标高为 0
	  (progn
	    (vla-put-elevation vlaObject 0)
	  )
      )
      
      (setq MSpace (vla-get-ModelSpace
		     (vla-get-ActiveDocument (vlax-get-acad-object))
		   )
      )
;;;获得模型空间

      (setq object_table (vlax-make-safearray vlax-vbObject '(0 . 0)))
;;;创建对象数组
      (vlax-safearray-fill object_table (list vlaObject))
;;;填充对象数组

      (setq indetermination
	     (VL-CATCH-ALL-APPLY
	       'vlax-invoke-method
	       (list MSpace
		 'AddRegion
		 object_table
		)
	     )
      ) ;;;创建面域,检查拓扑问题
      (if (not (VL-CATCH-ALL-ERROR-P indetermination)) 
	(progn
	  (ENTDEL (entlast))
	  (if (/= repeatPoint T) ;;;判断重复端点
	    (progn
	      (if (= (vlax-get-property vlaObject 'Closed) :vlax-true)
;;;检查是否闭合
		(progn
		  (setq successful T)
		)
		(progn
		  (Aisp-Error-Label
		    (AISP-GET-REGION-CENTROID vlaObject)
		    "权属线未闭合!"
		  )
		)
	      )
	    )
	    (progn
	      (Aisp-Error-Label (nth 0 coordList) "权属线存在重复端点!")
	    )
	  )
	)
	(progn
	  (vla-put-ConstantWidth vlaObject 1.25)
	  (Aisp-Error-Label (nth 0 coordList) "权属线存在拓扑错误!")
	)
      )
      (vlax-release-object MSpace)
    )
    (progn
      (setq successful nil)
    )
  )
;;;释放空间
  (gc)
  successful
)

;;;函数名称: Aisp-Error-Label
;;;接受参数: labelPoint (标注点) labelContent (标注内容)
;;;返回值:
;;;功能: 根据标注点进行内容标注
(defun Aisp-Error-Label (labelPoint labelContent / textstyle)
  (setq textstyle (getvar "TEXTSTYLE"))
   (entmake (list
	     '(0 . "LWPOLYLINE")
	     '(100 . "AcDbEntity")
	     '(410 . "Model")
	     '(8 . "Aisp_Error")
	     '(6 . "Continuous")
	     '(100 . "AcDbPolyline")  
	     '(90 . 3)
	     (cons 10 labelPoint)
	     (cons 10 (polar labelPoint 0.8 12))
	     (cons 10
		   (polar (polar labelPoint 0.8 12)
			  0.0
			  (* (strlen labelContent) 0.5)
		   )
	     )
	     )
  )
  (entmake (list
	     '(0 . "TEXT")
	     '(8 . "Aisp_Error")
	     '(40 . 0.8)
	     '(62 . 4)
	     (cons 1 labelContent)
	     (cons 7 textstyle)
	     (cons 10 (polar labelPoint 0.8 12))
	   )
  )
  (entmake (list
	     '(0 . "CIRCLE")
	     '(8 . "Aisp_Error")
	     '(40 . 15)
	     '(62 . 2)
	     (cons 10 labelPoint)
	   )
  )
)

;;;函数名称: Aisp-GetSpecifiedItemAllChild
;;;参数: SpecifiedItemHandle (指定项的句柄或键)
;;;返回值: ResultList (返回一个由所有项组成的列表)
;;;        列表样式:(list
;;;		     Parcel Child1 Child2 Child3 .....
;;;		     Parce2 Child1 Child2 Child3 .....
;;;		      ....
;;;		    )
;;; 获取指定项下所有子项的标签(包括子项的子项)
(defun Aisp-GetSpecifiedItemAllChild (SpecifiedItemHandle / ResultList first_Child_handle first_Child_label next_Child_handle label)
  (setq ResultList nil)
  (setq	first_Child_handle
	 ;;;获取首项的句柄
	 (dcl-Tree-GetFirstChildItem
	   AispOpenDCL/AispMain/AispTabStrip_Tree
	   SpecifiedItemHandle
	 )
  )
  (if (/= first_Child_handle nil)
    (progn
      (if (dcl-Tree-GetFirstChildItem
	   AispOpenDCL/AispMain/AispTabStrip_Tree
	   first_Child_handle
	 )
	(setq ResultList (reverse (Aisp-GetSpecifiedItemAllChild first_Child_handle)))
      )
      (setq first_Child_label
;;;获取首项的标签
	     (dcl-Tree-GetItemLabel
	       AispOpenDCL/AispMain/AispTabStrip_Tree
	       first_Child_handle
	     )
      )
      (setq ResultList (cons first_Child_label ResultList))
      (setq next_Child_handle first_Child_handle)
      (while (setq next_Child_handle
;;;使用循环每一次获取下一项
		    (dcl-Tree-GetNextSiblingItem
		      AispOpenDCL/AispMain/AispTabStrip_Tree
		      next_Child_handle
		    )
	     )
	(setq ResultList (append (reverse (Aisp-GetSpecifiedItemAllChild next_Child_handle)) ResultList))
	(setq label (dcl-Tree-GetItemLabel
		      AispOpenDCL/AispMain/AispTabStrip_Tree
		      next_Child_handle
		    )
	)
	(setq ResultList (cons label ResultList))
      )
    )
  )
  ResultList
)

;;;函数名称:Aisp-Make-Parcel-Line
;;;接受参数:parcel_name(宗地图元名),obligee(权利人),QHDM_number(区号代码),parcel_number(宗地号),land_type(土地类型)
;;;返回值:successful,成功返回"T",失败返回"nil"
;;;根据图元名,权利人,区号代码,宗地号,地类编号,设置线型颜色为红色,生成界址线
;;;备注:有必要注册一个申请名(regapp "QHDM")
(defun Aisp-Make-Parcel-Line (parcel_name  obligee  QHDM_number
			      parcel_number  land_type
			      / ls south_ls successful new_ls
			     )
	(setq successful nil)
	
	(setq vlaName (vlax-ename->vla-object parcel_name))	;;;转换为vla对象
	(setq DataType (vlax-make-safearray vlax-vbInteger '(0 . 6)))  ;;;xdata类型数组
    (setq Data (vlax-make-safearray vlax-vbVariant '(0 . 6)))  ;;;xdata值数组
	
	;;;开始填充数组
	(setq errorFlag1 (vl-catch-all-apply 'vlax-safearray-fill (list DataType (list 1001 1000 1001 1000 1000 1000 1000))))
	(setq errorFlag2(vl-catch-all-apply 'vlax-safearray-fill (list Data (list "QHDM" QHDM_number "SOUTH" "300000" parcel_number obligee land_type))))
	
	;;;写入扩展属性
	(if (and
	      (not (vl-catch-all-error-p errorFlag1))
	      (not (vl-catch-all-error-p errorFlag2))
	    )
	  (progn
	    (vla-setxdata vlaName DataType Data)
;;;设置对象颜色为红色
	    (vla-put-Color vlaName acRed)
	    ;;;设置权属线图层至"JZD"
	    (vla-put-layer vlaName "JZD")
	    (setq successful T)
	  )
	)


    successful
)

;;;函数名称: Aisp-ZoomObject
;;;接受参数: VlaObject (缩放到的vla对象)
;;;返回值:
;;;缩放到指定的对象
(defun Aisp-ZoomObject (VlaObject / flag)
;;;获取ACAD对象
  (setq acadapplic (vlax-get-acad-object))
;;;获得对象边界对角点
  (setq	flag (VL-CATCH-ALL-APPLY
	       'vla-GetBoundingBox
	       (list VlaObject 'minExt 'maxExt)
	     )
  )
  (if (not (VL-CATCH-ALL-ERROR-P flag))
    (progn
;;;跳转到该对象
      (vla-ZoomWindow acadapplic minExt maxExt)
    )
  )
  (vlax-release-object acadapplic)
)