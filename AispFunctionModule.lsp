
;;;									函数名称一览表:

;;;	ifdef

;;;									几何算法相关函数

;;;函数名称:  Aisp-Get_center_relative
;;;参数:   ename(图元名)
;;;返回值:  MJ:MIDPOINT(list中心点)
;;;求多边形内相对中心点

;;;函数名称: Aisp-Get-Region-Centroid
;;;参数: Vla_Object vla对象
;;;返回值: Centroid 成功返回:形心坐标  失败返回nil
;;;获得对象形心

;;;函数名称:  Aisp-Get-AcDbPolyline-Coordinate
;;;参数: Object_name (vla对象)
;;;返回值: coor_ls
;;;获取对象坐标,并返回

;;;函数名称: Aisp-Judge-IsInPolygon
;;;参数: checkPoint (待检查点) polygonPoints (多边形坐标表)
;;;返回值: successful 存在于多边形内,返回 T 否则 返回 nil
;;;检查点是否存在多边形内(包括 内部, 在边上)

;;;函数名称:  Aisp-Get-Coordinate
;;;接受参数:ename图元名，获取此图元坐标
;;;返回值:返回一个坐标表:coordinate_list
;;;功能:提取实体坐标,并返回一个表.

;;;函数名称:Aisp-isSegmentsIntersectant
;;;接受参数:segA,segB 数据格式'((xxx xxx) (xxx xxx))
;;;返回值:return "T"相交 "nil"不相交
;;;功能:判断线段交叉,端点坐标相同不判断

;;;函数名称: Aisp-Rand
;;;参数: bottom (最小值)  top (最大值)
;;;返回值:
;;;生成随机数

;;;函数名称: Aisp-Judge-PolylineDirection 
;;;参数: Vla_name
;;;返回值: Result (0. 参数类型错误 1. 顺时针 2. 反时针)
;;;判断多段线绘图方向,顺时针,逆时针

;; | GE_PtInPoly
;; | -----------------------------------------------------------------------------
;; | Function : Detects if a point is within a closed polygon.  This is done by
;; |   drawing a line from pt to x+ direction and count the number of
;; |   times it cuts the polygon under test. An even number of cut
;; |   indicates that the pt is outside the polygon.
;;	函数:检测一个点是否在一个封闭的多边形中

;; | GE_PtOutsideAllPoly
;; | ----------------------------------------------------------------------------
;; | Function : Detects if a point falls outside each of a set of closed polygons
;;		检测一个点是否落在每个封闭多边形集合的外面


;;;									OpenDcl函数相关函数

;;;函数名称:  Aisp-Load_ODCL_Project
;;;参数：projname = 工程名称字串(后缀为"*.odcl"、"*.odcl.lsp"或不带后缀)或者OpenDcl工程数据表
;;;      reload =  T 强制重载工程 or nil 若已加载，则什么也不干
;;;      password = 设定密码字串 or nil
;;;      alias = 替代项目关键字 or nil
;;;返回值:
;;;加载OpenDcl工程

;;;函数名称: Aisp-AutoLoadODclArx
;;;参数: RuntimePath (OpenDCL运行库存储路径) 为 nil 时,在CAD支持路径搜索
;;;返回值: loaded (1 3 表示加载成功 2 表示加载失败)
;;;自动加载OpenDcl函数




;;;									字符相关函数

;;;函数名称: Aisp-Separator-Substr
;;;参数: str (字符串) separator (分隔符)
;;;返回值: new_str_ls (字符串表)
;;;指定分隔符,分隔字符,返回一个分隔完成的字符表

;;;函数名称: XD::String:RegExpS
;;;参数:    pat = 正则表达式模式 ,对应vbs正则表达式的模式(expression)。说明: \\号要用\\\\替代.
;;; 	    str = 字符串
;;; 	    key = \"i\" \"g\" \"m\" , \"i\"不区分大小写（Ignorecase）,\"g\"全局匹配（Global）.
;;;           \"m\"多行模式（Multiline），以上几个关键字可以组合使用，或用 \"\".
;;;返回值:  返回匹配的字符列表，或无一匹配返回nil
;;功能: 对字符串进行正则表达式匹配测试.

;;;函数名称: Aisp-get-Chinese
;;;参数:    str (需要分割的字符串)
;;;返回值:  返回提取到的中文字符
;;功能: 对字符串进行正则表达式匹配测试.提取其中的中文字符


;;;									Windows_ActiveX相关函数

;;;函数名称: Aisp-GetFilePath
;;;接受参数: msg(信息提示内容)
;;;返回值: path(文件路径)
;;;获得_文件夹路径

;;;函数名称: Aisp-Voice
;;;参数: 无
;;;返回值: 无
;;;文字转换语音

;;;函数名称: Aisp-Get-GUID
;;;参数: 无
;;;返回值: 无
;;;生成GUID（全球唯一标志码）
;;;软件的加密

;;;函数名称: Aisp-GetFilePath
;;;接受参数: msg(信息提示内容)
;;;返回值: path(文件路径)
;;;获得_文件夹路径

;;;									功能简化相关函数

;;;函数名称: Aisp-Selection-Set  (已废弃)
;;;参数:  mode (选择集模式) pt_list (选择范围点表):可选参数  filter_list (条件过滤表):可选参数
;;;返回值: ename_table (选择范围内的图元句柄表)
;;;取得目标选择集内的图元句柄表
;;;	enddef

;;;函数名称: Aisp-Make-DistanceLabel
;;;参数: Vla-Object (POLYLINE_vla对象) Text_Height (文字高度) Text_gap (文字到边距离)  Text_mode (标注内部1或外部 2)
;;;返回值: successful 
;;;标注多边形距离,闭合多边形, 内联函数: Aisp-Judge-PolylineDirection

;;;函数名称: Aisp-Judge-Label
;;;参数: polygon_coord_ls 多边形坐标表
;;;返回值; result_ls 成功返回 边的序号 失败返回 nil
;;;判断多边形需要标注墙界的边,判断局限性很大
;;;内联函数: Aisp-Get-AcDbPolyline-Coordinate


;;;									文件处理相关函数

;;;函数名称: Aisp-Find-File
;;;参数: parent_file_path (父文件路径) pattern (模式字符)
;;;返回值: file_path_table (文件路径表)
;;;返回指定文件父目录下,符合条件的文件及其所有子文件目录下符合条件的文件名路径,递归查找


;;;载入VL扩展
(vl-load-com)



;;;
;;;						函数定义从以下开始:
;;;



;;;函数名称:  Aisp-Get_center_relative
;;;参数:   ename(图元名)
;;;返回值:  MJ:MIDPOINT(list中心点)
;;;求多边形内相对中心点
(defun Aisp-Get_center_relative (ename /  Pts   2R Mk   Mkline  points   DelLine   Tssred
		   i   lst  N  Newlst    DistList     R   Number  Tssbak TssSub  Pt)
    (setq Obj     (Vlax-Ename->Vla-Object ename)
	  Tssbak  (Vlax-Get Obj 'Thickness )
	  TssSub  (Vlax-Put Obj 'Thickness 0 ))
    (setq Pts     (GetBoundingBox ename)
	  2R      (MJ:MIDPOINT (CAR Pts) (CADR Pts))
	  Mk      (entmake (list (cons 0 "LINE")(cons 8 "JMDSS")(cons 10 (polar 2R 0.0 1000))(cons 11 (polar 2R 3.14159 1000))))
	  Mkline  (entlast)
	  points  (vlax-invoke (vlax-ename->vla-object ename) 'IntersectWith (vlax-ename->vla-object Mkline) acExtendOtherEntity)
	  Tssred  (Vlax-Put Obj 'Thickness (eval Tssbak) )
	  DelLine (entdel Mkline)
	  i       0
	  lst     nil
	  )
  (repeat (/ (length points) 3)
       (setq lst (append lst (list (list (nth i points) (nth (1+ i) points) (nth (+ 2 i) points)))))
       (setq i (+ i 3))
  )
  (setq lst (px lst))
  (if (>= (length lst) 4)
      (progn
	  (setq N      0
		Newlst nil)
	  (repeat (/ (length lst) 2)
	      (setq Newlst (append Newlst (list (list (nth N lst) (nth (1+ N) lst)))))
	      (setq N (+ 2 N))
	  )
	  (setq DistList nil
	        R        0)
	  (repeat (length Newlst)
	    (setq Number (nth R Newlst) 
	          DistList (append DistList  (list(distance (car Number) (cadr Number)))))
	    (setq R (1+ R))
	  )
	  (setq  Pt (nth (vl-position (car (vl-sort DistList '>)) DistList) Newlst))
	(MJ:MIDPOINT (car pt) (cadr pt));返回值
      )
      (MJ:MIDPOINT (car lst) (cadr lst));返回值
  )
)

(defun MJ:MIDPOINT (P1 P2)
  (mapcar '(lambda (X Y) (/ (+ X Y) 2.0)) P1 P2)
)

(defun GetBoundingBox (ent / ll ur)
    (vla-getboundingbox (vlax-ename->vla-object ent) 'll 'ur)
    (mapcar 'vlax-safearray->list (list ll ur))
)

(defun px (X)
    (vl-sort  X
             (function (lambda (e1 e2) 
                         (< (car e1) (car e2)) ) ) )
)


;;;函数名称:  Aisp-Load_ODCL_Project
;;;参数：projname = 工程名称字串(后缀为"*.odcl"、"*.odcl.lsp"或不带后缀)或者OpenDcl工程数据表
;;;      reload =  T 强制重载工程 or nil 若已加载，则什么也不干
;;;      password = 设定密码字串 or nil
;;;      alias = 替代项目关键字 or nil
;;;返回值:
;;;加载OpenDcl工程
(defun Aisp-Load_ODCL_Project
       (projname reload password alias / bytes rtype Projects e)
  (cond
    ((null dcl_project_import)
     (prompt "OpenDCL未加载...\n")
    )
    ((= 'list (type projname)) ;_ projname 为OpenDcl工程数据表
     (dcl_project_import projname password alias)
    )
    ((and
       (progn
	 (if (=	".LSP"
		(substr (strcase projname) (- (strlen projname) 3))
	     )
	   (setq projname (substr projname 1 (- (strlen projname) 4)))
	 )
	 (if (/= ".ODCL"
		 (substr (strcase projname) (- (strlen projname) 4))
	     )
	   (setq projname (strcat projname ".odcl"))
	 )
	 (setq bytes (vl-get-resource projname))
       )
       (eq 'str (setq rtype (type bytes)))
       (not (eq "" bytes))
     ) ;_ 从打包的资源文件中读取OpenDCL工程
     (if reload
       (dcl_project_import bytes password alias)
       (if (or
	     (not (setq Projects (dcl_GetProjects)))
	     (not (member (strcase (vl-filename-base projname))
			  (mapcar 'strcase Projects)
		  )
	     )
	   )
	 (dcl_project_import bytes password alias)
       )
     )
    )
    ;;查找OpenDCL工程文件进行加载
    ((if (not (VL-CATCH-ALL-ERROR-P
		(setq e	(VL-CATCH-ALL-APPLY
			  'dcl_project_load
			  (list (findfile projname) reload alias)
			)
		)
	      )
	 )
       e
     )
    )
  )
)

;;;函数名称: Aisp-AutoLoadODclArx
;;;参数: RuntimePath (OpenDCL运行库存储路径) 为 nil 时,在CAD支持路径搜索
;;;返回值: loaded (1 3 表示加载成功 2 表示加载失败)
;;;自动加载OpenDcl函数
(defun Aisp-AutoLoadODclArx (RuntimePath / loaded fn v fnn)
  (cond
    ((VL-FILE-DIRECTORY-P RuntimePath)
     (if (not dcl_getversionex) ;_ OpenDcl仍未加载
	;;按AutoCAD的不同版本搜索opendcl.arx文件进行加载
	(cond
	  ((= "16" (setq v (itoa (atoi (getvar 'acadver)))))
	   (if
	     (setq
	       fnn (strcat RuntimePath "\\" (setq fn (strcat "opendcl." v ".arx")))
	     )
	      (setq loaded (arxload fnn "1"))
	      (setq loaded "2")
	   )
	  )
	  ((or (= "17" v) (= "18" v) (= "19" v))
	   (if (= "x86" (getenv "PROCESSOR_ARCHITECTURE")) ;_ 32位系统
	     (if (setq fnn
			(strcat RuntimePath "\\" (setq fn (strcat "OpenDCL." v ".arx")))
		 )
	       (setq loaded (arxload fnn "1"))
	       (setq loaded "2")
	     )
	     ;;64位系统
	     (if (setq fnn
			(strcat RuntimePath "\\" (setq fn (strcat "OpenDCL.x64." v ".arx")))
		 )
	       (setq loaded
		      (arxload fnn
			       "1"
		      )
	       )
	       (setq loaded "2")
	     )
	   )
	  )
	  (t (Setq loaded "2"))
	)
	(setq loaded "3") ;_ 已加载
      )
    )
    ((= RuntimePath nil)
      ;;系统已安装OpenDcl的加载方式
      (if (and
	    (not dcl_getversionex) ;_ OpenDcl未加载
	    (= 2 (boole 1 (getvar "DEMANDLOAD") 2))
	  )
	(VL-CATCH-ALL-APPLY 'vl-cmdf (list "opendcl")) ;_ 调用OpenDcl命令加载OpenDcl
      )
      (if (not dcl_getversionex) ;_ OpenDcl仍未加载
	;;按AutoCAD的不同版本搜索opendcl.arx文件进行加载
	(cond
	  ((= "16" (setq v (itoa (atoi (getvar 'acadver)))))
	   (if
	     (setq
	       fnn (findfile (setq fn (strcat "opendcl." v ".arx")))
	     )
	      (setq loaded (arxload fnn "1"))
	      (setq loaded "2")
	   )
	  )
	  ((or (= "17" v) (= "18" v) (= "19" v))
	   (if (= "x86" (getenv "PROCESSOR_ARCHITECTURE")) ;_ 32位系统
	     (if (setq fnn
			(findfile (setq fn (strcat "OpenDCL." v ".arx")))
		 )
	       (setq loaded (arxload fnn "1"))
	       (setq loaded "2")
	     )
	     ;;64位系统
	     (if (setq fnn
			(findfile (setq fn (strcat "OpenDCL.x64." v ".arx")))
		 )
	       (setq loaded
		      (arxload fnn
			       "1"
		      )
	       )
	       (setq loaded "2")
	     )
	   )
	  )
	  (t (Setq loaded "2"))
	)
	(setq loaded "3") ;_ 已加载
      )
      ;; 加载OpenDcl失败，直接中断程序
      (if (= "1" loaded)
	(progn
	  (princ (strcat fn "加载失败！程序将退出！"))
	  (exit)
	)
	(if (= "2" loaded)
	  (progn
	    (princ
	      (strcat "未找到对应的\"" fn "\"文件！程序将退出！")
	    )
	    (exit)
	  )
	)
      )
    )
  )
  ;;返回3，表示加载成功
  loaded
)


;;;函数名称: Aisp-GetFilePath
;;;接受参数: msg(信息提示内容)
;;;返回值: path(文件路径)
;;;获得_文件夹路径
(defun Aisp-GetFilePath (msg / WinShell shFolder path catchit)
  (vl-load-com)
  (setq winshell (vlax-create-object "Shell.Application")); (vlax-dump-object winshell T)
  (setq shFolder (vlax-invoke-method WinShell 'BrowseForFolder 0 msg 1))
  (setq
    catchit (vl-catch-all-apply
       '(lambda ()
   (setq shFolder (vlax-get-property shFolder 'self))
   (setq path (vlax-get-property shFolder 'path))
        )
     )
  )
  (if (vl-catch-all-error-p catchit)
    nil
    path
  )
)


;;函数名称:  Aisp-Get-AcDbPolyline-Coordinate
;;;参数: Object_name (vla对象)
;;;返回值: coor_ls
;;;获取对象坐标,并返回
(defun Aisp-Get-AcDbPolyline-Coordinate (Object_Name / coordinates temp coor coor_ls)
  (setq	coordinates
	 (vlax-safearray->list
	   (vlax-variant-value (vla-get-coordinates Object_Name))
	 )
  )				;;;获取坐标,变体转换安全数组,数组转换list
  (setq temp 1 coor nil coor_ls nil)
  (foreach var coordinates
    (setq coor (cons var coor))
    (if (= (rem temp 2) 0)
      (progn
	(setq coor (REVERSE coor))
	(setq coor_ls (cons coor coor_ls))
	(setq coor nil)
      )
    )
    (setq temp (1+ temp))
  )
  (setq coor_ls (reverse coor_ls))
)

;;;函数名称: Aisp-Judge-IsInPolygon
;;;参数: checkPoint (待检查点) polygonPoints (多边形坐标表)
;;;返回值: successful 存在于多边形内,返回 T 否则 返回 nil
;;;检查点是否存在多边形内(包括 内部, 在边上)
(defun Aisp-Judge-IsInPolygon (checkPoint
				polygonPoints		/
				counter	    p1		i
				pointCount  xinters	successful  temp
			       )
  (setq	counter	0
	p1	(nth 0 polygonPoints)
	i 1
	pointCount (length polygonPoints)
	xinters nil
	successful nil
  )
  (foreach temp polygonPoints
    (if (equal temp checkPoint)
      (setq successful T)
    )
  )
  (if (not successful)
  (progn
  (repeat pointCount
    (setq p2 (nth (rem i pointCount) polygonPoints))
    (if (and
	  (> (nth 0 checkPoint) (min (nth 0 p1) (nth 0 p2)))
	  (<= (nth 0 checkPoint) (max (nth 0 p1) (nth 0 p2)))
	)
      (progn
	(if (<= (nth 1 checkPoint) (max (nth 1 p1) (nth 1 p2)))
	  (progn
	    (if	(/= (nth 0 p1) (nth 0 p2))
	      (progn (setq xinters
			    (+ (/ (* (- (nth 0 checkPoint) (nth 0 p1))
				     (- (nth 1 p2) (nth 1 p1))
				  )
				  (- (nth 0 p2) (nth 0 p1))
			       )
			       (nth 1 p1)
			    )
		     )
		     (if (or (= (nth 1 p1) (nth 1 p2))
			     (<= (nth 1 checkPoint) xinters)
			 )
		       (setq counter (1+ counter))
		     )
	      )
	    )
	  )
	)
      )
    )
    (setq i (1+ i))
    (setq p1 p2)
  )
  (if (= (rem counter 2) 0)
    (progn
      (setq successful nil)
    )
    (progn
      (setq successful T)
    )
  )
  )
  )
  successful
)


;;;函数名称: Aisp-Rand
;;;参数: bottom (最小值)  top (最大值)
;;;返回值:
;;;生成随机数
(defun Aisp-Rand (bottom top / value)
  (setq value (+ (rem (getvar "CPUTICKS") (- top bottom)) bottom))
)

;;;函数名称: Aisp-Separator-Substr
;;;参数: str (字符串) separator (分隔符)
;;;返回值: new_str_ls (字符串表)
;;;指定分隔符,分隔字符,返回一个分隔完成的字符表
(defun Aisp-Separator-Substr (str separator / str_ls child_ls str_ls new_str_ls)
  (setq separator_ascii (ascii separator))	;;;获取字符ASCII码
  (setq strs (VL-STRING->LIST str))	;;;转换为list
  (setq	child_ls nil
	str_ls nil
	new_str_ls nil
  )

  (foreach str_temp strs		;;;依次取出每一个项
    (if	(= separator_ascii str_temp)
      (progn
	(setq child_ls (reverse child_ls))
	(setq str_ls (cons child_ls str_ls))
	(setq child_ls nil)
      )
      (progn
	(setq child_ls (cons str_temp child_ls))
      )
    )
  )
  
  (setq child_ls (reverse child_ls))	;;;最后一个分隔符无法加入表,在此加入
  (setq str_ls (cons child_ls str_ls))
  (setq str_ls (reverse str_ls))
  
  (foreach str_temp str_ls		;;;表转为为字符
    (setq str_temp (VL-LIST->STRING str_temp))
    (setq new_str_ls (cons str_temp new_str_ls))
  )
  
  (setq new_str_ls (reverse new_str_ls))	;;;倒置表,返回输入顺序
)

;;;函数名称:Aisp-isSegmentsIntersectant
;;;接受参数:segA,segB 数据格式'((xxx xxx) (xxx xxx))
;;;返回值:return "T"相交 "nil"不相交
;;;功能:判断线段交叉,端点坐标相同不判断
(defun Aisp-isSegmentsIntersectant (segA segB / return abc abd cda cdb)
  (setq return nil)
  (setq	abc (- (* (- (car (nth 0 segA)) (car (nth 0 segB)))
		  (- (cadr (nth 1 segA)) (cadr (nth 0 segB)))
	       )
	       (* (- (cadr (nth 0 segA)) (cadr (nth 0 segB)))
		  (- (car (nth 1 segA)) (car (nth 0 segB)))
	       )
	    )
  )
  (setq	abd (- (* (- (car (nth 0 segA)) (car (nth 1 segB)))
		  (- (cadr (nth 1 segA)) (cadr (nth 1 segB)))
	       )
	       (* (- (cadr (nth 0 segA)) (cadr (nth 1 segB)))
		  (- (car (nth 1 segA)) (car (nth 1 segB)))
	       )
	    )
  )
  (if (>= (* abc abd) 0)
    (setq return nil)
  )
  (setq	cda (- (* (- (car (nth 0 segB)) (car (nth 0 segA)))
		  (- (cadr (nth 1 segB)) (cadr (nth 0 segA)))
	       )
	       (* (- (cadr (nth 0 segB)) (cadr (nth 0 segA)))
		  (- (car (nth 1 segB)) (car (nth 0 segA)))
	       )
	    )
  )
  (setq cdb (- (+ cda abc) abd))
  (if (>= (* cda cdb) 0)
    (progn
      (setq return nil)
    )
    (progn
      (setq return T)
    )
  )
  return
)

;;;函数名称:  Aisp-Get-Coordinate
;;;接受参数:ename图元名，获取此图元坐标
;;;返回值:返回一个坐标表:coordinate_list
;;;功能:提取实体坐标,并返回一个表.
(defun Aisp-Get-Coordinate
       (ename / coordinate_list ename_list foreach_list)
  (setq ename_list (entget ename))
  (setq coordinate_list nil)
  (foreach foreach_list	ename_list
    (if	(or (= 10
	       (car foreach_list)
	    )
	    (= 11
	       (car foreach_list)
	    )
	)
      (setq coordinate_list (cons (cdr foreach_list) coordinate_list))
    )
  )
  (reverse coordinate_list)
)

;;;函数名称: Aisp-Voice
;;;参数: 无
;;;返回值: 无
;;;文字转换语言
(defun Aisp-Voice (/ objTTS)
  (setq objTTS (vlax-create-object "SAPI.SpVoice"))
  (vlax-invoke objTTS 'speak "Hello,everyone!")
  (vlax-release-object objTTS)
  (princ)
)

;;;函数名称: Aisp-Get-GUID
;;;参数: 无
;;;返回值: 无
;;;生成GUID（全球唯一标志码）
;;;可以用来做为软件的加密
(defun Aisp-Get-GUID (/ objSLTL str)
  (setq objSLTL (vlax-create-object "Scriptlet.TypeLib"))
  (setq str (vlax-get objSLTL 'GUID))
  (vlax-release-object objSLTL)
  str
)

;;;函数名称: Aisp-Find-File
;;;参数: parent_file_path (父文件路径) pattern (模式字符)
;;;返回值: file_path_table (文件路径表)
;;;返回指定文件父目录下,符合条件的文件及其所有子文件目录下符合条件的文件名路径,递归查找
(defun Aisp-Find-File (parent_file_path pattern
		       / file_name_ls file_path_table folder_ls)
  (setq file_name_ls (VL-REMOVE-IF-NOT '(LAMBDA (x) (wcmatch x pattern)) (VL-DIRECTORY-FILES parent_file_path nil 1)))
  ;;;列出当前目录下,所有tfw tif文件
  (if file_name_ls
    (progn
      (setq counter 0)
      (repeat (length file_name_ls)
	(setq file_name (nth counter file_name_ls))
	(setq counter (1+ counter))
	(setq file_path_table
	       (cons (strcat parent_file_path "\\" file_name)
		     file_path_table
	       )
	)
      )
    )
  )

  (setq folder_ls (VL-REMOVE-IF-NOT '(LAMBDA (x) (not (wcmatch x "\.,\.\."))) (VL-DIRECTORY-FILES parent_file_path nil -1)))
  ;;;列出当前目录下,所有文件夹,去除 <.> 文件 <..> 文件
  (if folder_ls
    (progn
      (setq folder_ls
	     (MAPCAR '(lambda (x) (strcat parent_file_path "\\" x))
		     folder_ls
	     )
      )
      (foreach folder folder_ls
	(setq file_path_table (append (Aisp-Find-File folder pattern) file_path_table))
      )
    )
  )
  
  file_path_table
)




;;;函数名称: Aisp-Judge-PolylineDirection 
;;;参数: Vla_name
;;;返回值: Result (0. 参数类型错误 1. 顺时针 2. 反时针)
;;;判断多段线绘图方向,顺时针,逆时针
(defun Aisp-Judge-PolylineDirection (Vla_name / ss fd ang offsetObj)
  (if (= (vlax-get-property Vla_name 'ObjectName) "AcDbPolyline")
    (progn
      (setq fd (vlax-curve-getFirstDeriv Vla_name 0.5))
      (setq ang (atan (/ (cadr fd) (car fd))))
      (setq offsetplineObj
	     (car (vlax-safearray->list
		    (vlax-variant-value
		      (vla-OFFSET Vla_name 0.0001)
		    )
		  )
	     )
      )
      (if (> (vlax-curve-getdistatparam
	       Vla_name
	       (vlax-curve-getEndParam Vla_name)
	     ) ;_ 结束vlax-curve-getdistatparam
	     (vlax-curve-getdistatparam
	       offsetplineObj
	       (vlax-curve-getEndParam offsetplineObj)
	     ) ;_ 结束vlax-curve-getdistatparam
	  )
	(setq Resuls 1)		;;;顺时针
	(setq Resuls 2)		;;;反时针
      )
      (vla-delete offsetplineObj)
    )
    (progn
      (setq Resuls 0)		;;;参数类型错误
    )
  )
  Resuls
)

;;;函数名称: Aisp-Make-DistanceLabel
;;;参数: Vla-Object (POLYLINE_vla对象) Text_Height (文字高度) Text_gap (文字到边距离)  Text_mode (标注内部1或外部 2)
;;;返回值: successful 
;;;标注多边形距离,闭合多边形, 内联函数: Aisp-Judge-PolylineDirection
(defun Aisp-Make-DistanceLabel
       (Vla-Object Text_Height Text_gap Text_mode / successful)
  (if (and
	(= "AcDbPolyline"
	   (vlax-get-property Vla-Object 'ObjectName)
	)
;;;判断参数合法性
	(or (= 'REAL (type Text_Height))
	    (= 'INT (type Text_Height))
	)
	(or (= 'REAL (type Text_gap))
	    (= 'INT (type Text_gap))
	)
      )

    (progn
      (setq successful T)     
      (setq DOC	(vla-get-ModelSpace
		  (vla-get-ActiveDocument (vlax-get-acad-object))
		)
      )
;;;获取模型空间
      (setq coord_ls (Aisp-Get-AcDbPolyline-Coordinate Vla-Object))
;;;获取顶点坐标


      (setq direction (Aisp-Judge-PolylineDirection Vla-Object))
;;;判断多段线绘图顺序
      (cond
	(
	 (= Text_mode 1)
	 (if (= direction 2)
	   (progn
	     (setq coord_ls (reverse coord_ls))
	   )
	 )
	)
	(
	 (= Text_mode 2)
	 (if (= direction 1)
	   (progn
	     (setq coord_ls (reverse coord_ls))
	   )
	 )
	)
      )		;;;内部外部标注判断
      
      (setq conuter 0)
      (foreach coord coord_ls
	(setq conuter (1+ conuter))
	(setq n_coord (nth conuter coord_ls))
;;;获得表下一个元素
	(if (not n_coord)
	  (setq n_coord (nth 0 coord_ls))
	)
;;;闭合多算一次
	(setq coord   (trans coord 0 1)
	      n_coord (trans n_coord 0 1)
	)
	(if (> (car coord) (car n_coord))
	  (progn
	    (setq temp coord
		  coord	n_coord
		  n_coord temp
	    )
	    (setq dist (distance coord n_coord))
;;;线段距离
	    (setq ang (angle coord n_coord))
;;;线段角度
	    (setq text_label (rtos dist 2 2))
;;;标注文字
	    (setq text_coor (polar (polar coord ang (* 0.5 dist))
				   (+ ang (* 0.5 pi))
				   Text_gap
			    )
	    )
;;;文字对齐点
	  )
	  (progn
	    (setq dist (distance coord n_coord))
;;;线段距离
	    (setq ang (angle coord n_coord))
;;;线段角度
	    (setq text_label (rtos dist 2 2))
;;;标注文字
	    (setq text_coor (polar (polar coord ang (* 0.5 dist))
				   (- ang (* 0.5 pi))
				   (+ Text_gap Text_Height)
			    )
	    )
;;;文字对齐点
	  )
	)

	(setq vla-text (vlax-invoke-method
			 DOC
			 'AddText
			 text_label
			 (vlax-3d-point text_coor)
			 Text_Height
		       )
	)
;;;创建文字
	(vlax-put-property vla-text 'Alignment 1)	;;;设置文字对齐方式
	(vlax-put-property vla-text 'Rotation ang)	;;;设置文字角度
	(vlax-put-property
	  vla-text
	  'TextAlignmentPoint
	  (vlax-3d-point text_coor)
	)	;;;设置文字对齐点
      )
    )

    (progn
      (setq successful nil)
    )
  )

  (vlax-release-object DOC)
  (GC)
  successful
)


;; | GE_PtOutsideAllPoly
;; | ----------------------------------------------------------------------------
;; | Function : Detects if a point falls outside each of a set of closed polygons
;;		检测一个点是否落在每个封闭多边形集合的外面
;; | Argument : 'pt'    - point ot be tested 
;; |            'PolyLst' - A nested list of list of points forming the polgon
;; | Return   : T if 'pt' is outside all the polygons, nil if 'pt' falls inside
;; |            atleast on polygon.
;; | Comments : If 'pt' falls exactly on the edge of the bounding polygon, it is
;; |            considered to lie INSIDE the polygon. In other words, the points
;; |            must be completely OUTSIDE the polygons to be considered so.
;;		如果'pt'恰好落在边界多边形的边缘上，它就是
;;		被认为位于多边形内部的|。换句话说，就是这些点
;;		必须完全在多边形之外才能这样考虑。
;; | Updated  : January 8, 2000
;; | e-mail   : rakesh.rao@4d-technologies.com 
;; | Web      : www.4d-technologies.com
;; | ----------------------------------------------------------------------------


(defun GE_PtOutsideAllPoly (pt PolyLst / Outside More cnt vlist)

  (setq
    Outside nil
    More T
    cnt	0
  )

  (while More
    (setq vlist (nth cnt PolyLst))
    (if	vlist
      (progn
	(if (GE_PtInPoly pt vlist T)
	  (setq More nil)
	  (setq cnt (1+ cnt))
	)
      )
      (setq
	Outside	T
	More nil
      )
    )
  )
  Outside
)



;; | GE_PtInPoly
;; | -----------------------------------------------------------------------------
;; | Function : Detects if a point is within a closed polygon.  This is done by
;; |   drawing a line from pt to x+ direction and count the number of
;; |   times it cuts the polygon under test. An even number of cut
;; |   indicates that the pt is outside the polygon.
;;	函数:检测一个点是否在一个封闭的多边形中
;; | Argument : 'pt'    - point ot be tested 
;; |            'vlist' - List of points forming the polgon
;; |            'flag'  - If 'T', point on the line is inside else outside
;; |
;; | Return   : T if point is inside else nil 
;; | Updated  : July 24, 1999
;; | e-mail   : rakesh.rao@4d-technologies.com 
;; | Web      : www.4d-technologies.com
;; | -----------------------------------------------------------------------------


(defun GE_PtInPoly (pt	   vlist  flag	 /	NumInts	      diff
		    cnt	   online p1	 p1code	p1x    p1y    p2
		    p2code p2x	  p2y	 ttl	x      xdiff  xx
		    y	   ydiff  Idx	 len
		   )

  (if (not (equal (car vlist) (last vlist)))
    (setq vlist (append vlist (list (car vlist))))
  )

  (setq
    X	    (car pt)
    Y	    (cadr pt)
    len	    (length vlist)
    cnt	    0
    Idx	    0
    NumInts 0
    OnLine  nil
  )

  (while (and (not OnLine) (< cnt len))
    (setq
      p2     (nth cnt vlist)
      p2x    (car p2)
      p2y    (cadr p2)
      p2code (if (>= p2y y)
	       2
	       0
	     )				; add 2 if p2 is higher
      p2code (if (>= p2x x)
	       (1+ p2code)
	       p2code
	     )				; add 1 if p2 on the right
    )

    (if	p1
      (setq
	diff  (boole 6 p1code p2code)	; xor to see if quadrant has changed eg 1-2
	ydiff (boole 1 diff 2)		; AND to see if 2nd bit has chnaged => crssing of y axis
	xdiff (boole 1 diff 1)		; and to see if 1st bit changed
	p1x   (car p1)
	p1y   (cadr p1)
      )
    )

					; ** check to see if segment has crossed x+ line
    (if	(= ydiff 2)			; 0001 (or 1) means y axis crossed
      (progn
	(setq xx (+ p1x (* (/ (- p2x p1x) (- p2y p1y)) (- y p1y))))
					; x value of intersection pt
	(cond
					; ** Check to see if point is on the line
	  ((equal xx x 0.0001)		; is it on the line?
	   (setq online T)		; force Outside after adding 1
	  )

					; ** check if pt is on the line
	  ((> xx x)			; is intersect on RHS?
	   (setq NumInts (1+ NumInts))
	  )
	)
      )
    )

					; **Special treatment for horizontal line
    (if	(and (= xdiff 1) (= y p1y p2y))
      (setq OnLine T)
    )

					; ** Proceed to next segment 
    (setq
      p1code p2code
      p1     p2
      cnt    (1+ cnt)
    )
  )

  (if Online
    flag				; flag = T means ptonline is inside poly
    (= (boole 1 NumInts 1) 0001)	; odd number of crosing - masking off all bots > 1 (and 0001 with result)
  )
)



;;;函数名称: Aisp-Judge-Label
;;;参数: polygon_coord_ls 多边形坐标表
;;;返回值; result_ls 成功返回 边的序号 失败返回 nil
;;;判断多边形需要标注墙界的边,判断局限性很大
;;;内联函数: Aisp-Get-AcDbPolyline-Coordinate
(defun Aisp-Judge-Label	(polygon_coord_ls
			  /	       ang_ls	    temp
			  polygon_coord		    n_item
			  temp_ang_ls  new_ang_ls   result_ls
			 )
  (if (= 'LIST
	 (type polygon_coord_ls)
      )
    (progn
      (setq ang_ls nil)
;;;设置 ang_ls 为 nil
      (setq temp 0)
;;;临时计数为0
      (foreach polygon_coord polygon_coord_ls
	(setq temp (1+ temp))
	(if (not (setq n_item (nth temp polygon_coord_ls)))
;;;获得最后一条边
	  (setq n_item (nth 0 polygon_coord_ls))
	)
	(setq
	  ang_ls (cons (list temp
			     (angle polygon_coord n_item)
			     (distance polygon_coord n_item)
		       )
		       ang_ls
		 )
	)
      )
;;;循环获得多边形每条边序号,弧度值,距离 (list 序号 弧度 距离)
      (setq ang_ls (reverse ang_ls))
;;;反向列表
      (setq
	ang_ls (vl-sort ang_ls '(lambda (a b) (< (cadr a) (cadr b))))
      )
;;;按弧度值排序列表
      (setq temp_ang_ls nil)
      (setq temp 0)
      ;;重置计数为0
      (setq new_ang_ls nil)
;;;归类方向后的新表
      (foreach ang ang_ls
	(setq temp (1+ temp))
	(setq temp_ang_ls (cons ang temp_ang_ls))
;;;每次将项放入临时表
	(if (setq n_item (nth temp ang_ls))
;;;下一项是否为空
	  (progn
	    (if	(> (abs (- (cadr ang) (cadr n_item))) 0.25)
;;;前后弧度值相差 0.15 则归为下一类
	      (progn
		(setq new_ang_ls (cons temp_ang_ls new_ang_ls))
		(setq temp_ang_ls nil)
	      )
	    )
	  )
	  (progn
	    (setq new_ang_ls (cons temp_ang_ls new_ang_ls))
;;;达到表尾,同样将 temp_ang_ls 放入新表
	  )
	)
      )
      (if (= 4 (length new_ang_ls))
	(progn
	  (setq	result_ls
		 (list
		   (car
		     (nth 0
			  (vl-sort
			    (nth 0 new_ang_ls)
			    '(lambda (a b) (> (caddr a) (caddr b)))
			  )
		     )
		   )
		   (car
		     (nth 0
			  (vl-sort
			    (nth 1 new_ang_ls)
			    '(lambda (a b) (> (caddr a) (caddr b)))
			  )
		     )
		   )
		   (car
		     (nth 0
			  (vl-sort
			    (nth 2 new_ang_ls)
			    '(lambda (a b) (> (caddr a) (caddr b)))
			  )
		     )
		   )
		   (car
		     (nth 0
			  (vl-sort
			    (nth 3 new_ang_ls)
			    '(lambda (a b) (> (caddr a) (caddr b)))
			  )
		     )
		   )
		 )
	  )
	)
	(progn
	  (setq result_ls nil)
	)
      )
    )
    (progn
      (setq result_ls nil)
    )
  )
  result_ls
)


;;;函数名称: Aisp-Get-Region-Centroid
;;;参数: Vla_Object vla对象
;;;返回值: Centroid 成功返回:形心坐标  失败返回nil
;;;获得对象形心
(defun Aisp-Get-Region-Centroid(Vla_Object / MSpace object_table re_object_table Centroid)
  (if (= "AcDbPolyline" (vlax-get-property Vla_Object 'ObjectName))
    (progn
      (setq MSpace (vla-get-ModelSpace
		     (vla-get-ActiveDocument (vlax-get-acad-object))
		   )
      )
;;;获得模型空间

      (setq object_table (vlax-make-safearray vlax-vbObject '(0 . 0)))
;;;创建对象数组
      (vlax-safearray-fill object_table (list Vla_Object))
;;;填充对象数组

      (setq re_object_table
	     (vlax-invoke-method
	       MSpace
	       'AddRegion
	       object_table
	     )
      )
;;;创建面域,获得面域对象数组
      (setq re_object_table
	     (vlax-safearray->list
	       (vlax-variant-value re_object_table)
	     )
      )
;;;转换为list

      (setq
	Centroid (vlax-get-property (nth 0 re_object_table) 'Centroid)
      )
;;;获得形心坐标
      (setq
	Centroid (vlax-safearray->list (vlax-variant-value Centroid))
      )
;;;转换为list

      (vlax-invoke-method (nth 0 re_object_table) 'Delete)
;;;删除面域对象

      (vlax-release-object MSpace)
;;;释放空间
      (gc)
    )
    (progn
      (setq Centroid nil)
    )
  )
  Centroid
)

;;;函数名称: XD::String:RegExpS
;;;参数:    pat = 正则表达式模式 ,对应vbs正则表达式的模式(expression)。说明: \\号要用\\\\替代.
;;; 	    str = 字符串
;;; 	    key = \"i\" \"g\" \"m\" , \"i\"不区分大小写（Ignorecase）,\"g\"全局匹配（Global）.
;;;           \"m\"多行模式（Multiline），以上几个关键字可以组合使用，或用 \"\".
;;;返回值:  返回匹配的字符列表，或无一匹配返回nil
;;功能: 对字符串进行正则表达式匹配测试. 
(defun XD::String:RegExpS (pat str key / end keys matches x)
  (if (not *xxvbsexp)
    (setq *xxvbsexp (vlax-get-or-create-object "VBScript.RegExp"))
  )
  (vlax-put *xxvbsexp 'Pattern pat)
  (if (not key)
    (setq key "")
  )
  (setq key (strcase key))
  (setq keys '(("I" "IgnoreCase") ("G" "Global")
         ("M" "Multiline")
        )
  )
  (mapcar
    '(lambda (x)
       (if (wcmatch key (strcat "*" (car x) "*"))
         (vlax-put *xxvbsexp (read (cadr x)) 0)
         (vlax-put *xxvbsexp (read (cadr x)) -1)
       )
     )
    keys
  )
  (setq matches (vlax-invoke *xxvbsexp 'Execute str))
  (vlax-for x matches (setq end (cons (vla-get-value x) end)))
  (reverse end)
)

;;;函数名称: Aisp-get-Chinese
;;;参数:    str (需要分割的字符串)
;;;返回值:  返回提取到的中文字符
;;功能: 对字符串进行正则表达式匹配测试.提取其中的中文字符
(defun Aisp-get-Chinese (str / resultStr strList)
  (setq delim "[\\u4E00-\\u9FA5]+")
  (setq strList (xd::string:regexps delim str ""))
  (setq resultStr "")
  (foreach str strList
    (setq resultStr (strcat resultStr str))
  )
  resultStr
)



