
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<

;;;OpenDCL 模块代码

;;;<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<




;;;函数名称:	c:AispTools_ZJ/MainFrame#OnInitialize
;;;参数:
;;;返回值
;;;功能		窗体初始化
(defun c:AispTools_ZJ/MainFrame#OnInitialize (/)
  (dcl-Tree-AddParent
    AispTools_ZJ/MainFrame/AispTabStrip_Tree1
    (list
      (list "地籍区域" "DJQY" 0 1 1)
    )
  )
  (dcl-Control-SetText AispTools_ZJ/MainFrame/VersionTextBox "注意:错误的操作步骤,可能会造成数据无法挽回的错误 \r\n 请仔细阅读软件操作说明! \r\n\r\n 工具部分功能暂时无法使用 \r\n 敬请期待 \r\n Updated Date:2020.6.8 \r\n By:const")
  (dcl-Control-SetText AispTools_ZJ/MainFrame/ApplicationTextBox (Aisp-Get-GUID))
  (dcl-Control-SetEnabled AispTools_ZJ/MainFrame/Tree1_Transform nil)	;;;设置 "开始转换" 按钮为不可用
  (dcl-Control-SetEnabled AispTools_ZJ/MainFrame/Tree1_End_Check nil)	;;;设置 "转换前最后检查" 按钮为不可用
)

;;;函数名称:	c:AispTools_ZJ/MainFrame#OnSize
;;;参数:
;;;返回值
;;;功能		窗体动态调整大小
(defun c:AispTools_ZJ/MainFrame#OnSize (NewWidth NewHeight /)
  ;;; AispTools 调整窗口大小时触发事件
  ;;; 工具 选项卡的窗体大小调整
  (dcl-Control-SetHeight AispTools_ZJ/MainFrame/MainTabStrip NewHeight) ;;;设置 AispTabStrip  高度,与 AispTools 的窗口大小相同
  (dcl-Control-SetWidth AispTools_ZJ/MainFrame/MainTabStrip NewWidth)  ;;;设置 AispTabStrip  宽度,与 AispTools 的窗口大小相同

  ;;; 宗地转换 选项卡的窗体大小
  (MAPCAR '(LAMBDA (x) (dcl-Control-SetWidth x (- NewWidth 20)))
	  ;;; FunctionSelection Frame1 Frame2 Frame3
	  ;;; Frame4 SingleConversion MessageBox 保持与父级窗体 AispMain 居中对齐
	  (list	
		AispTools_ZJ/MainFrame/Frame1
		AispTools_ZJ/MainFrame/MessageBox
	  )
  )
  
  (MAPCAR '(LAMBDA (x) (dcl-Control-SetWidth x (- NewWidth 120)))
	  ;;; 动态调整 Frame1_ComboBox1 Frame1_ComboBox2 大小,始终保持左右间距父窗体 60
	  (list AispTools_ZJ/MainFrame/QSX_Check
		AispTools_ZJ/MainFrame/QLR_Check
	  )
  )
  (MAPCAR '(LAMBDA (x) (dcl-Control-SetWidth x (- NewWidth 70)))
	  ;;; 动态调整 QSX_Check QLR_Check 大小,始终保持左右间距父窗体 58 12
	  (list AispTools_ZJ/MainFrame/Frame1_ComboBox1
		AispTools_ZJ/MainFrame/Frame1_ComboBox2
	  )
  )
  (MAPCAR '(LAMBDA (x) (dcl-Control-SetLeft x (- NewWidth 88)))
	  ;;; 动态调整 Tree1_TransFrame Tree1_Sort Tree1_Delete_ZD Tree1_Delete_DJQY Tree1_New_DJQY 大小,始终保持右间距父窗体 
	  (list
	    AispTools_ZJ/MainFrame/Tree1_Transform
	    AispTools_ZJ/MainFrame/Tree1_Sort
	    AispTools_ZJ/MainFrame/Tree1_End_Check
	    AispTools_ZJ/MainFrame/Tree1_Add_ZD
	    AispTools_ZJ/MainFrame/Tree1_Delete_DJQY
	    AispTools_ZJ/MainFrame/Tree1_New_DJQY
	   )
  )
  (MAPCAR '(LAMBDA (x) (dcl-Control-SetLeft x (- NewWidth 55)))
	  ;;; 动态调整 QSXPictureBox QLRPictureBox 大小,始终保持右间距父窗体 
	  (list
	    AispTools_ZJ/MainFrame/QSXPictureBox
	    AispTools_ZJ/MainFrame/QLRPictureBox
	   )
  )
  (dcl-Control-SetWidth ;;; 动态调整 AispTabStrip_Tree1 大小,始终保持左间距父窗体 30
    AispTools_ZJ/MainFrame/AispTabStrip_Tree1 (- NewWidth 118))

  ;;; 关于 选项卡的窗体大小
  (dcl-Control-SetWidth AispTools_ZJ/MainFrame/VersionTextBox (- NewWidth 2))  ;;;设置 VersionTextBox 的宽度与主窗体相同
  (dcl-Control-SetWidth AispTools_ZJ/MainFrame/Frame2 (- NewWidth 2))  ;;;设置 Frame2 的宽度与主窗体相同
  (dcl-Control-SetWidth AispTools_ZJ/MainFrame/registered (- NewWidth 120))
  (MAPCAR '(LAMBDA (x) (dcl-Control-SetWidth x (- NewWidth 90)))
	  ;;; 动态调整 ApplicationTextBox AuthorizationTextBox 大小,始终保持左右间距父窗体 20
	  (list AispTools_ZJ/MainFrame/ApplicationTextBox
		AispTools_ZJ/MainFrame/AuthorizationTextBox
	  )
  )
)

;;;函数名称:	c:AispTools_ZJ/MainFrame#OnDocActivated
;;;参数:
;;;返回值
;;;功能	当用户切换到另一个打开的AutoCAD绘图时触发此事件
(defun c:AispTools_ZJ/MainFrame#OnDocActivated (/)
  (c:AispTools_ZJ/MainFrame#OnInitialize)
)

;;;函数名称:	c:AispTools_ZJ/MainFrame#OnDocActivated
;;;参数:
;;;返回值
;;;功能	当用户关闭最后一次打开的AutoCAD绘图时触发此事件
(defun c:AispTools_ZJ/MainFrame#OnEnteringNoDocState (/)
  (dcl-Form-Close AispTools_ZJ/MainFrame)
)










;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<

;;;OpenDCL控件事件 模块代码

;;;<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;;;函数名称:	c:AispTools_ZJ/MainFrame/registered#OnClicked
;;;参数:
;;;返回值
;;;功能		注册 按钮单击事件
(defun c:AispTools_ZJ/MainFrame/registered#OnClicked (/)
  (dcl-MessageBox
    "Thank you for loving me so much"
    "GoodBye"
  )
)

;;;函数名称:	c:AispTools_ZJ/MainFrame/QLR_Check#OnClicked
;;;参数:
;;;返回值
;;;功能		权利人检查 按钮单击事件
(defun c:AispTools_ZJ/MainFrame/QLR_Check#OnClicked (/)
  (dcl-sendstring "QLR_Check ")
)

;;;函数名称:	c:AispTools_ZJ/MainFrame/QSX_Check#OnClicked
;;;参数:
;;;返回值
;;;功能		权属线检查 按钮单击事件
(defun c:AispTools_ZJ/MainFrame/QSX_Check#OnClicked (/)
  (dcl-sendstring "QSX_Check ")
)

;;;函数名称:	c:AispTools_ZJ/MainFrame/Tree1_Transform#OnClicked
;;;参数:
;;;返回值
;;;功能		开始转换 按钮单击事件
(defun c:AispTools_ZJ/MainFrame/Tree1_Transform#OnClicked (/
							    flag
							    allDJQYList
							    allParcelList
							    counter
							    strList
							    QHDM_number
							    tempParcel_number
							    land_type
							    parcelHandleList
							    Ename
							    counterCP
							    vlaName
							    coordCP
							    layer
							    obligee
							    Parcel_number
							    selectCP
							   )
  (setq flag (dcl-Form-Show AispTools_ZJ/PayDialog))	;;;窗体返回标志位 为 5 ,才继续执行
  (if (= flag 5)
    (progn
;;;      (setq acadapplic (vlax-get-acad-object))
;;;      (vla-ZoomAll acadapplic)	;;;缩放全局窗口
      (dcl-Control-SetEnabled AispTools_ZJ/MainFrame/Tree1_Transform nil)	;;;设置 "开始转换" 按钮为不可用
      (dcl-Control-SetEnabled AispTools_ZJ/MainFrame/Tree1_End_Check nil)	;;;设置 "转换前最后检查" 按钮为不可用
      
      (setq allDJQYList (Aisp-GetStrcatLabelList "DJQY"))
      (setq allParcelList (mapcar '(lambda (x) (Aisp-GetStrcatLabelList x)) allDJQYList))
      (setq counter 0)
      (foreach DJQYItem allDJQYList
	(setq strList (Aisp-Separator-Substr DJQYItem ","))
	(setq QHDM_number (substr (nth 0 strList) 1 6))	;;;区号代码
	(setq tempParcel_number (substr (nth 0 strList) 7))	;;;宗地号前 8 位
	(setq land_type (nth 1 strList)) 	;;;土地类型
	
	(setq parcelHandleList (VL-CATCH-ALL-APPLY 'nth (list counter allParcelList)))	;;;获得当前地籍区域下所有宗地实体的图元句柄
	(setq counter (1+ counter))
	(if (not (VL-CATCH-ALL-ERROR-P parcelHandleList))
	  (progn
	    (foreach parcelHandleItem parcelHandleList
	      (setq Ename (handent parcelHandleItem))	;;;取得图元名称
	      (Aisp-ZoomObject (vlax-ename->vla-object Ename)) ;;;缩放到权属线
	      (setq coordCP (AISP-GET-ACDBPOLYLINE-COORDINATE (vlax-ename->vla-object Ename)))	;;;取得权属线端点坐标
	      
	      (vla-put-ConstantWidth (vlax-ename->vla-object Ename) 0.15)	;;;设置全局宽度为0.15
	      
	      (setq selectCP (ssget "CP" coordCP (list '(-4 . "<OR")
						       '(8 . "ParcelNumLayer")
						       '(8 . "qlrLayer")
						       '(-4 . "OR>")
						       )))
	      (setq counterCP 0)
	      (repeat (sslength selectCP)
		(setq vlaName (vlax-ename->vla-object (ssname selectCP counterCP)))
		(setq counterCP (1+ counterCP))
		(setq layer (vlax-get-property vlaName 'Layer))
		(cond
		  (
  		   (= layer "ParcelNumLayer")
		   (setq Parcel_number (strcat tempParcel_number (vlax-get-property vlaName 'TextString)))	;;;获取组号+流水号 然后合并到 tempParcel_number
		   
		  )
		  (
		   (= layer "qlrLayer")
		   (setq obligee (vlax-get-property vlaName 'TextString))	;;;获取权利人
		  )
		)
	      )
	      (Aisp-Make-Parcel-Line
		Ename obligee QHDM_number parcel_number land_type)
	    )
	  )
	)
      )
      
      (dcl-sendstring "AispRegenzd ")
      
    )
  )
  
  (gc)
)

;;;函数名称:	c:AispTools_ZJ/MainFrame/Tree1_Sort#OnClicked
;;;参数:
;;;返回值
;;;功能		宗地排序 按钮单击事件
(defun c:AispTools_ZJ/MainFrame/Tree1_Sort#OnClicked (/)
  (dcl-sendstring "Aisp-ParcelSort ")
)

;;;函数名称:	c:AispTools_ZJ/MainFrame/Tree1_Delete_ZD#OnClicked
;;;参数:
;;;返回值
;;;功能		最后检查 按钮单击事件
(defun c:AispTools_ZJ/MainFrame/Tree1_End_Check#OnClicked (/)
  (dcl-sendstring "Aisp-LastCheck ")
)

;;;函数名称:	c:AispTools_ZJ/MainFrame/Tree1_Add_ZD#OnClicked
;;;参数:
;;;返回值
;;;功能		加入宗地 按钮单击事件
(defun c:AispTools_ZJ/MainFrame/Tree1_Add_ZD#OnClicked (/ flag)
  (setq flag (dcl-Form-Show AispTools_ZJ/AddParcel))
  (cond
    (
     (= flag 3)
     (dcl-sendstring "Aisp-ScopeToAddParcel ")
    )
    (
     (= flag 4)
     (dcl-sendstring "Aisp-SingleAddParcel ")
    )
  )
)

;;;函数名称:	c:AispTools_ZJ/MainFrame/Tree1_Delete_DJQY#OnClicked
;;;参数:
;;;返回值
;;;功能		删除地籍子区 按钮单击事件
(defun c:AispTools_ZJ/MainFrame/Tree1_Delete_DJQY#OnClicked (/ flag)
  (setq flag (dcl-Form-Show AispTools_ZJ/DeleteDJQY))
)

;;;函数名称:	c:AispTools_ZJ/MainFrame/Tree1_New_DJQY#OnClicked
;;;参数:
;;;返回值
;;;功能		新建地籍子区 按钮单击事件
(defun c:AispTools_ZJ/MainFrame/Tree1_New_DJQY#OnClicked (/ flag )
  (setq flag (dcl-Form-Show AispTools_ZJ/NewDJQY))  
  (cond
    (
     (or (= flag 2) (= flag 4) (= flag 1))
     (dcl-messagebox "操作已取消" "Aisp提示")
    )
  )
)

;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; AispTools_ZJ/NewDJQY 窗体
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;;;函数名称:	c:AispTools_ZJ/NewDJQY/OK#OnClicked
;;;参数:
;;;返回值
;;;功能		AispTools_ZJ/NewDJQY 窗体 确定 按钮事件
(defun c:AispTools_ZJ/NewDJQY/OK#OnClicked (/ xq djq djzq zdh lxh matchTable)
  (setq	xq   (dcl-Control-GetText AispTools_ZJ/NewDJQY/XQ)
	djq  (dcl-Control-GetText AispTools_ZJ/NewDJQY/DJQ)
	djzq (dcl-Control-GetText AispTools_ZJ/NewDJQY/DJZQ)
	lxh  (dcl-Control-GetText AispTools_ZJ/NewDJQY/SetStartingNumber)
  ) ;;;获取用户键入内容

  (setq zdh (VL-CATCH-ALL-APPLY 'strcat (list xq djq djzq "JC" "," "0702" "," lxh)))  ;;;所有键入内容,组成一个字符串
  
  (setq matchTable (VL-CATCH-ALL-APPLY 'Aisp-GetStrcatLabelList (list "DJQY")))	;;;获取地籍区域下所有子项标签

  (if (and (/= xq "") (/= djq "") (/= djzq "") (/= lxh ""))
    (progn
      (if (and (not (VL-CATCH-ALL-ERROR-P matchTable))
	       (not (VL-CATCH-ALL-ERROR-P zdh))
	  )
	(progn
	  (if (/= matchTable nil)
	    (progn
	      (if
		(not
		  (vl-remove-if-not '(lambda (x) (= x zdh)) matchTable)
		)
;;;查询重复,重复则不加入树
		 (progn
		   (dcl-Tree-AddChild
		     AispTools_ZJ/MainFrame/AispTabStrip_Tree1
		     (List
		       (List
			 "DJQY"
			 zdh
			 zdh
		       )
		     )
		   )
		 )
		 (progn
		   (dcl-messagebox "请不要创建重复的地籍区域!" "Warning")
		 )
	      )
	    )
	    (progn
	      (dcl-Tree-AddChild
		AispTools_ZJ/MainFrame/AispTabStrip_Tree1
		(List
		  (List
		    "DJQY"
		    zdh
		    zdh
		  )
		)
	      )
	    )
	  )
	)
	(progn
	  (dcl-Control-SetText
	    AispTools_ZJ/MainFrame/MessageBox
	    "c:AispTools_ZJ/NewDJQY/OK#OnClicked->matchTable \r\n是一个错误对象"
	  )
	  (dcl-messagebox
	    "c:AispTools_ZJ/NewDJQY/OK#OnClicked->matchTable 是一个错误对象"
	    "InternalError"
	  )
	)
      )
    )
    (progn
      (DCL-MESSAGEBOX "Error: 不允许输入空值" "Aisp提示")
    )
  )
  
  
  (dcl-Form-Close AispTools_ZJ/NewDJQY 3)
)

;;;函数名称:	c:AispTools_ZJ/NewDJQY/Cancel#OnClicked
;;;参数:
;;;返回值
;;;功能		AispTools_ZJ/NewDJQY 窗体 取消 按钮事件
(defun c:AispTools_ZJ/NewDJQY/Cancel#OnClicked (/)
  (dcl-Form-Close AispTools_ZJ/NewDJQY 4)
)


;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; AispTools_ZJ/DeleteDJQY   窗体
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
(defun c:AispTools_ZJ/DeleteDJQY#OnInitialize (/ label_first_child_handle itemList)
  (setq	label_first_child_handle
;;;获得首项的句柄
	 (dcl-Tree-GetFirstChildItem
	   AispTools_ZJ/MainFrame/AispTabStrip_Tree1
	   "DJQY"
	 )
  )
  (if (/= label_first_child_handle nil)
    (progn
      (setq itemList (Aisp-GetStrcatLabelList
		       "DJQY"
		     )
      )
      (dcl-Control-SetList
	AispTools_ZJ/DeleteDJQY/ListBox1
	itemList
      )
      (dcl-Control-SetEnabled AispTools_ZJ/DeleteDJQY/DeleteALL T)
      (dcl-Control-SetEnabled AispTools_ZJ/DeleteDJQY/Delete T)
    )
    (progn
      (dcl-Control-SetList
	AispTools_ZJ/DeleteDJQY/ListBox1
	"尚未创建地籍区域"
      )
      (dcl-Control-SetEnabled AispTools_ZJ/DeleteDJQY/DeleteALL nil)
      (dcl-Control-SetEnabled AispTools_ZJ/DeleteDJQY/Delete nil)
    )
  )
  
)

(defun c:AispTools_ZJ/DeleteDJQY/DeleteALL#OnClicked (/ flag itemList item)	;;;全部删除
  (setq itemList (dcl-Control-GetList AispTools_ZJ/DeleteDJQY/ListBox1))	;;;获取listbox的列表
  (if (/= itemList nil)
    (progn
      (setq flag (dcl-Form-Show AispTools_ZJ/Prompt))
      (cond
	(
	 (= flag 3)
	 (foreach item itemList
;;; 迭代删除每一项
	   (dcl-Tree-DeleteItem
	     AispTools_ZJ/MainFrame/AispTabStrip_Tree1
	     (dcl-Tree-GetItemHandle
	       AispTools_ZJ/MainFrame/AispTabStrip_Tree1
	       item
	     )
	   )
	 )
	 (dcl-ListBox-Clear AispTools_ZJ/DeleteDJQY/ListBox1)
;;;清空列表
	 (dcl-Control-SetEnabled
	   AispTools_ZJ/DeleteDJQY/DeleteALL
	   nil
	 )
;;;设置控件为不可用
	)
	(
	 (or (= flag 1) (= flag 2) (= flag 4))
	 (dcl-messagebox "操作已取消" "Aisp提示")
	)
      )
    )
  )
)

(defun c:AispTools_ZJ/DeleteDJQY/Delete#OnClicked (/ itemIndex)	;;;单个删除
  (if (dcl-Control-GetList AispTools_ZJ/DeleteDJQY/ListBox1)
    (progn
      (setq flag (dcl-Form-Show AispTools_ZJ/Prompt))
      (cond
	(
	 (= flag 3)
	 (setq itemIndex (dcl-ListBox-GetCurSel
			   AispTools_ZJ/DeleteDJQY/ListBox1
			 )
	 )
;;;获取选择项的索引
	 (if (/= itemIndex -1)
	   (progn
	     (dcl-Tree-DeleteItem
	       AispTools_ZJ/MainFrame/AispTabStrip_Tree1
	       (dcl-Tree-GetItemHandle
		 AispTools_ZJ/MainFrame/AispTabStrip_Tree1
		 (dcl-ListBox-GetItemText
		   AispTools_ZJ/DeleteDJQY/ListBox1
		   itemIndex
		 )
	       )
	     )
;;;删除 树 的项
	     (dcl-ListBox-DeleteItem
	       AispTools_ZJ/DeleteDJQY/ListBox1
	       itemIndex
	     )
;;;删除列表选择的项
	   )
	 )
	)
	(
	 (or (= flag 1) (= flag 2) (= flag 4))
	 (dcl-messagebox "操作已取消" "Aisp提示")
	)
      )
    )
    (progn
      (dcl-messagebox "没有可以删除的项目" "Aisp提示")
    )
  )
  
  
)

;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; AispTools_ZJ/Prompt   窗体
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
(defun c:AispTools_ZJ/Prompt/OK#OnClicked (/)
  (dcl-Form-Close AispTools_ZJ/Prompt 3)
)

(defun c:AispTools_ZJ/Prompt/Cancel#OnClicked (/)
  (dcl-Form-Close AispTools_ZJ/Prompt 4)
)

;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; AispTools_ZJ/AddParcel   窗体
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
(defun c:AispTools_ZJ/AddParcel/ScopeToAdd#OnClicked (/)
  (dcl-Form-Close AispTools_ZJ/AddParcel 3)
)

(defun c:AispTools_ZJ/AddParcel/SingleAdd#OnClicked (/)
  (dcl-Form-Close AispTools_ZJ/AddParcel 4)
)

;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; AispTools_ZJ/SelectDJQY   窗体
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
(defun c:AispTools_ZJ/SelectDJQY#OnInitialize (/ itemList)
  (setq itemList (Aisp-GetStrcatLabelList "DJQY"))
  (if (/= itemList nil)
    (progn
      (dcl-Control-SetList AispTools_ZJ/SelectDJQY/DJQYComboBox itemList)
      (dcl-ComboBox-SetCurSel AispTools_ZJ/SelectDJQY/DJQYComboBox 0)
      (dcl-Control-SetEnabled AispTools_ZJ/SelectDJQY/DJQYComboBox  T)
    )
    (progn
      (dcl-Control-SetText AispTools_ZJ/SelectDJQY/DJQYComboBox "尚未创建地籍区域")
      (dcl-Control-SetEnabled AispTools_ZJ/SelectDJQY/DJQYComboBox  nil)
    )
  )
  
)

;;; "确定" 按钮事件
(defun c:AispTools_ZJ/SelectDJQY/TextButton1#OnClicked (/)
  (setq StaticSelectDJQY (dcl-Control-GetText AispTools_ZJ/SelectDJQY/DJQYComboBox))
  (dcl-Form-Close AispTools_ZJ/SelectDJQY 3)
)

;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; AispTools_ZJ/PayDialog   窗体
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;;; "支付界面" 初始化事件
(defun c:AispTools_ZJ/PayDialog#OnInitialize (/)
  ;;;设置费用明细
  (setq DJQYList (Aisp-GetStrcatLabelList "DJQY"))
  (dcl-Control-SetCaption AispTools_ZJ/PayDialog/DJQYTotal (strcat "当前总共创建 "  (rtos (length DJQYList) 2 0)  " 个地籍区域"))
  (setq QSXList (mapcar '(lambda (x) (Aisp-GetStrcatLabelList x)) DJQYList))
  (setq QSXTotal 0)
  (mapcar '(lambda (x) (if (vl-consp x) (setq QSXTotal (+ QSXTotal (length x))))) QSXList)
  (dcl-Control-SetCaption AispTools_ZJ/PayDialog/QSXTotal (strcat "总共需要转换 "  (rtos QSXTotal 2 0)  " 条权属线"))
  (dcl-Control-SetCaption AispTools_ZJ/PayDialog/PayTotal (strcat "费用合计为 "  (rtos (* QSXTotal 0.1) 2 2)  " 元"))
  ;;;设置申请码
  (dcl-Control-SetText AispTools_ZJ/PayDialog/ApplicationCodeBox (Aisp-GenApplicationCode))
)

;;;用户试图关闭对话框事件
(defun c:AispTools_ZJ/PayDialog#OnCancelClose (Reason /)
  (if (or (= Reason 1) (= Reason 0))
    (dcl-Form-Close AispTools_ZJ/PayDialog)
  )
)

;;;使用支付宝 按钮事件
(defun c:AispTools_ZJ/PayDialog/ZFBPay#OnClicked (/)
  (dcl-Form-Show AispTools_ZJ/ZFBPay)
)

;;;使用微信 按钮事件
(defun c:AispTools_ZJ/PayDialog/WechatPay#OnClicked (/)
  (dcl-Form-Show AispTools_ZJ/WeChatPay)
)

;;;开始转换 按钮事件
(defun c:AispTools_ZJ/PayDialog/Transform#OnClicked (/ ApplicationCode AuthorizationCode)
  (setq ApplicationCode (dcl-Control-GetText AispTools_ZJ/PayDialog/ApplicationCodeBox))
  (setq AuthorizationCode (dcl-Control-GetText AispTools_ZJ/PayDialog/AuthorizationCodeBox))
  (if (/= AuthorizationCode "")
    (progn
      (if (Aisp-CalcAuthorizationCode ApplicationCode AuthorizationCode)
	(progn
	  (dcl-Form-Close AispTools_ZJ/PayDialog 5)	;;;所有验证通过,返回关闭窗体标志 5
	)
	(progn
	  (dcl-messagebox "授权码错误!" "Aisp提示")
	)
      )
    )
    (progn
      (dcl-messagebox "请填写授权码!" "Aisp提示")
    )
  )
  
)

;;;opendcl无法使用 command ,调用此命令
(defun c:AispRegenzd (/ qsxLayer selectX)
  (setq qsxLayer (dcl-Control-GetText AispTools_ZJ/MainFrame/Frame1_ComboBox2))
  (setq selectX (ssget "X" (list (cons 8 qsxLayer))))
  (command "regenzd" selectX "")
)


;;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;;; 子功能
;;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

;;;函数名称: Aisp-GetStrcatLabelList
;;;参数: Parent_Item_Handle (父项句柄)
;;;返回值: labelLisr (父项下所有的子项标签得列表)
;;; 获取指定父项下一级子项的列表
(defun Aisp-GetStrcatLabelList (Parent_Item_Handle / label_first_child_handle label_next_child_item labelList)
  (setq labelList nil)
  (setq	label_first_child_handle
;;;获得首项的句柄
	 (dcl-Tree-GetFirstChildItem
	   AispTools_ZJ/MainFrame/AispTabStrip_Tree1
	   Parent_Item_Handle
	 )
  )
  (if (/= label_first_child_handle nil)
    (progn
      (setq
	labelList (cons	(dcl-Tree-GetItemLabel
			  AispTools_ZJ/MainFrame/AispTabStrip_Tree1
			  label_first_child_handle
			)
			labelList
		  )
      )
      (setq label_next_child_item label_first_child_handle)
      (while (setq label_next_child_item
;;;使用循环每一次获取下一项
		    (dcl-Tree-GetNextSiblingItem
		      AispTools_ZJ/MainFrame/AispTabStrip_Tree1
		      label_next_child_item
		    )
	     )
	(setq
	  labelList
	   (cons
	     (dcl-Tree-GetItemLabel
	       AispTools_ZJ/MainFrame/AispTabStrip_Tree1
	       label_next_child_item
	     )
	     labelList
	   )
	)
      )
    )
    (progn
      (setq labelList nil)
    )
  )
  
  (reverse labelList)
)

;;;函数名称: Aisp-CalcAuthorizationCode
;;;参数:	ApplicationCode (申请码) UserAuthorizationCode (用户输入的授权码)
;;;返回值: 正确 T 不正确 nil
;;; 计算授权码,并校验用户输入授权码是否正确
(defun Aisp-CalcAuthorizationCode (ApplicationCode UserAuthorizationCode / successful matchList UsetMatchList resultList)
  (setq successful T)
  (setq matchList (mapcar '(lambda (x) (+ (fix (* x 0.8)) 2)) (VL-STRING->LIST ApplicationCode)))	;;;生成正确的授权码
  (setq UsetMatchList (VL-STRING->LIST UserAuthorizationCode))
  (setq resultList (VL-CATCH-ALL-APPLY 'mapcar (list '(lambda (x y) (= x y)) matchList UsetMatchList)))
  (if (not (VL-CATCH-ALL-ERROR-P resultList))
    (progn
      (mapcar '(lambda (x) (if (= x nil) (setq successful nil))) resultList)
    )
    (progn
      (setq successful nil)
    )
  )
  successful
)



;;;函数名称: Aisp-GenApplicationCode
;;;参数: 
;;;返回值: 返回生成的申请码
;;; 生成申请码
(defun Aisp-GenApplicationCode (/ DJQYNameList ParcelNumList mergeList totalNum ApplicationCode)
  (setq DJQYNameList (VL-CATCH-ALL-APPLY 'Aisp-GetStrcatLabelList (list "DJQY")))	;;;获取当前地籍区域
  (if (not (VL-CATCH-ALL-ERROR-P DJQYNameList))	;;;是否错误对象
    (progn
      (setq ParcelNumList (mapcar '(lambda (x) (rtos (length (Aisp-GetStrcatLabelList x)) 2 0)) DJQYNameList))	;;;获得地籍区域下的宗地数量
      (setq totalNum 0)
      (mapcar '(lambda (x) (setq totalNum (+ totalNum (atoi x)))) ParcelNumList)	;;;需要转换的权属线总量
      (setq totalNum (VL-LIST->STRING (mapcar '(lambda (x) (+ x 12)) (VL-STRING->LIST (rtos totalNum 2 0)))))	;;;总数量加密
      (setq mergeList (mapcar '(lambda (x y) (strcat x "," y)) DJQYNameList ParcelNumList)) ;;;合并 DJQYNameList ParcelNumList 的数量
      (setq ApplicationCode "")
      (mapcar '(lambda (x) (setq ApplicationCode (strcat ApplicationCode  x))) mergeList)	;;;合并表转换为字符串
      (setq ApplicationCode (VL-LIST->STRING (mapcar '(lambda (x) (+ (fix (/ x 0.8)) 1)) (VL-STRING->LIST ApplicationCode))))	;;;字符串加密
      (setq ApplicationCode (strcat ApplicationCode "*" totalNum))	;;;合并为新的申请码
    )
    (progn
      (setq ApplicationCode "Function: Aisp-GenApplicationCode 异常!请联系作者!")
    )
  )
  ApplicationCode
)





(dcl-Form-Show AispTools_ZJ/MainFrame)
(if (dcl-Form-IsActive AispTools_ZJ/MainFrame)
  (prompt "\nAispTools 已成功加载! 	-- 2020.12.1	By:const")
  (prompt "\nError: 未能成功加载! 	-- 2020.12.1	By:const")
)