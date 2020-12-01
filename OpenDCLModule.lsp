
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<

;;;OpenDCL ģ�����

;;;<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<




;;;��������:	c:AispTools_ZJ/MainFrame#OnInitialize
;;;����:
;;;����ֵ
;;;����		�����ʼ��
(defun c:AispTools_ZJ/MainFrame#OnInitialize (/)
  (dcl-Tree-AddParent
    AispTools_ZJ/MainFrame/AispTabStrip_Tree1
    (list
      (list "�ؼ�����" "DJQY" 0 1 1)
    )
  )
  (dcl-Control-SetText AispTools_ZJ/MainFrame/VersionTextBox "ע��:����Ĳ�������,���ܻ���������޷���صĴ��� \r\n ����ϸ�Ķ��������˵��! \r\n\r\n ���߲��ֹ�����ʱ�޷�ʹ�� \r\n �����ڴ� \r\n Updated Date:2020.6.8 \r\n By:const")
  (dcl-Control-SetText AispTools_ZJ/MainFrame/ApplicationTextBox (Aisp-Get-GUID))
  (dcl-Control-SetEnabled AispTools_ZJ/MainFrame/Tree1_Transform nil)	;;;���� "��ʼת��" ��ťΪ������
  (dcl-Control-SetEnabled AispTools_ZJ/MainFrame/Tree1_End_Check nil)	;;;���� "ת��ǰ�����" ��ťΪ������
)

;;;��������:	c:AispTools_ZJ/MainFrame#OnSize
;;;����:
;;;����ֵ
;;;����		���嶯̬������С
(defun c:AispTools_ZJ/MainFrame#OnSize (NewWidth NewHeight /)
  ;;; AispTools �������ڴ�Сʱ�����¼�
  ;;; ���� ѡ��Ĵ����С����
  (dcl-Control-SetHeight AispTools_ZJ/MainFrame/MainTabStrip NewHeight) ;;;���� AispTabStrip  �߶�,�� AispTools �Ĵ��ڴ�С��ͬ
  (dcl-Control-SetWidth AispTools_ZJ/MainFrame/MainTabStrip NewWidth)  ;;;���� AispTabStrip  ���,�� AispTools �Ĵ��ڴ�С��ͬ

  ;;; �ڵ�ת�� ѡ��Ĵ����С
  (MAPCAR '(LAMBDA (x) (dcl-Control-SetWidth x (- NewWidth 20)))
	  ;;; FunctionSelection Frame1 Frame2 Frame3
	  ;;; Frame4 SingleConversion MessageBox �����븸������ AispMain ���ж���
	  (list	
		AispTools_ZJ/MainFrame/Frame1
		AispTools_ZJ/MainFrame/MessageBox
	  )
  )
  
  (MAPCAR '(LAMBDA (x) (dcl-Control-SetWidth x (- NewWidth 120)))
	  ;;; ��̬���� Frame1_ComboBox1 Frame1_ComboBox2 ��С,ʼ�ձ������Ҽ�ุ���� 60
	  (list AispTools_ZJ/MainFrame/QSX_Check
		AispTools_ZJ/MainFrame/QLR_Check
	  )
  )
  (MAPCAR '(LAMBDA (x) (dcl-Control-SetWidth x (- NewWidth 70)))
	  ;;; ��̬���� QSX_Check QLR_Check ��С,ʼ�ձ������Ҽ�ุ���� 58 12
	  (list AispTools_ZJ/MainFrame/Frame1_ComboBox1
		AispTools_ZJ/MainFrame/Frame1_ComboBox2
	  )
  )
  (MAPCAR '(LAMBDA (x) (dcl-Control-SetLeft x (- NewWidth 88)))
	  ;;; ��̬���� Tree1_TransFrame Tree1_Sort Tree1_Delete_ZD Tree1_Delete_DJQY Tree1_New_DJQY ��С,ʼ�ձ����Ҽ�ุ���� 
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
	  ;;; ��̬���� QSXPictureBox QLRPictureBox ��С,ʼ�ձ����Ҽ�ุ���� 
	  (list
	    AispTools_ZJ/MainFrame/QSXPictureBox
	    AispTools_ZJ/MainFrame/QLRPictureBox
	   )
  )
  (dcl-Control-SetWidth ;;; ��̬���� AispTabStrip_Tree1 ��С,ʼ�ձ������ุ���� 30
    AispTools_ZJ/MainFrame/AispTabStrip_Tree1 (- NewWidth 118))

  ;;; ���� ѡ��Ĵ����С
  (dcl-Control-SetWidth AispTools_ZJ/MainFrame/VersionTextBox (- NewWidth 2))  ;;;���� VersionTextBox �Ŀ������������ͬ
  (dcl-Control-SetWidth AispTools_ZJ/MainFrame/Frame2 (- NewWidth 2))  ;;;���� Frame2 �Ŀ������������ͬ
  (dcl-Control-SetWidth AispTools_ZJ/MainFrame/registered (- NewWidth 120))
  (MAPCAR '(LAMBDA (x) (dcl-Control-SetWidth x (- NewWidth 90)))
	  ;;; ��̬���� ApplicationTextBox AuthorizationTextBox ��С,ʼ�ձ������Ҽ�ุ���� 20
	  (list AispTools_ZJ/MainFrame/ApplicationTextBox
		AispTools_ZJ/MainFrame/AuthorizationTextBox
	  )
  )
)

;;;��������:	c:AispTools_ZJ/MainFrame#OnDocActivated
;;;����:
;;;����ֵ
;;;����	���û��л�����һ���򿪵�AutoCAD��ͼʱ�������¼�
(defun c:AispTools_ZJ/MainFrame#OnDocActivated (/)
  (c:AispTools_ZJ/MainFrame#OnInitialize)
)

;;;��������:	c:AispTools_ZJ/MainFrame#OnDocActivated
;;;����:
;;;����ֵ
;;;����	���û��ر����һ�δ򿪵�AutoCAD��ͼʱ�������¼�
(defun c:AispTools_ZJ/MainFrame#OnEnteringNoDocState (/)
  (dcl-Form-Close AispTools_ZJ/MainFrame)
)










;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<

;;;OpenDCL�ؼ��¼� ģ�����

;;;<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;;;��������:	c:AispTools_ZJ/MainFrame/registered#OnClicked
;;;����:
;;;����ֵ
;;;����		ע�� ��ť�����¼�
(defun c:AispTools_ZJ/MainFrame/registered#OnClicked (/)
  (dcl-MessageBox
    "Thank you for loving me so much"
    "GoodBye"
  )
)

;;;��������:	c:AispTools_ZJ/MainFrame/QLR_Check#OnClicked
;;;����:
;;;����ֵ
;;;����		Ȩ���˼�� ��ť�����¼�
(defun c:AispTools_ZJ/MainFrame/QLR_Check#OnClicked (/)
  (dcl-sendstring "QLR_Check ")
)

;;;��������:	c:AispTools_ZJ/MainFrame/QSX_Check#OnClicked
;;;����:
;;;����ֵ
;;;����		Ȩ���߼�� ��ť�����¼�
(defun c:AispTools_ZJ/MainFrame/QSX_Check#OnClicked (/)
  (dcl-sendstring "QSX_Check ")
)

;;;��������:	c:AispTools_ZJ/MainFrame/Tree1_Transform#OnClicked
;;;����:
;;;����ֵ
;;;����		��ʼת�� ��ť�����¼�
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
  (setq flag (dcl-Form-Show AispTools_ZJ/PayDialog))	;;;���巵�ر�־λ Ϊ 5 ,�ż���ִ��
  (if (= flag 5)
    (progn
;;;      (setq acadapplic (vlax-get-acad-object))
;;;      (vla-ZoomAll acadapplic)	;;;����ȫ�ִ���
      (dcl-Control-SetEnabled AispTools_ZJ/MainFrame/Tree1_Transform nil)	;;;���� "��ʼת��" ��ťΪ������
      (dcl-Control-SetEnabled AispTools_ZJ/MainFrame/Tree1_End_Check nil)	;;;���� "ת��ǰ�����" ��ťΪ������
      
      (setq allDJQYList (Aisp-GetStrcatLabelList "DJQY"))
      (setq allParcelList (mapcar '(lambda (x) (Aisp-GetStrcatLabelList x)) allDJQYList))
      (setq counter 0)
      (foreach DJQYItem allDJQYList
	(setq strList (Aisp-Separator-Substr DJQYItem ","))
	(setq QHDM_number (substr (nth 0 strList) 1 6))	;;;���Ŵ���
	(setq tempParcel_number (substr (nth 0 strList) 7))	;;;�ڵغ�ǰ 8 λ
	(setq land_type (nth 1 strList)) 	;;;��������
	
	(setq parcelHandleList (VL-CATCH-ALL-APPLY 'nth (list counter allParcelList)))	;;;��õ�ǰ�ؼ������������ڵ�ʵ���ͼԪ���
	(setq counter (1+ counter))
	(if (not (VL-CATCH-ALL-ERROR-P parcelHandleList))
	  (progn
	    (foreach parcelHandleItem parcelHandleList
	      (setq Ename (handent parcelHandleItem))	;;;ȡ��ͼԪ����
	      (Aisp-ZoomObject (vlax-ename->vla-object Ename)) ;;;���ŵ�Ȩ����
	      (setq coordCP (AISP-GET-ACDBPOLYLINE-COORDINATE (vlax-ename->vla-object Ename)))	;;;ȡ��Ȩ���߶˵�����
	      
	      (vla-put-ConstantWidth (vlax-ename->vla-object Ename) 0.15)	;;;����ȫ�ֿ��Ϊ0.15
	      
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
		   (setq Parcel_number (strcat tempParcel_number (vlax-get-property vlaName 'TextString)))	;;;��ȡ���+��ˮ�� Ȼ��ϲ��� tempParcel_number
		   
		  )
		  (
		   (= layer "qlrLayer")
		   (setq obligee (vlax-get-property vlaName 'TextString))	;;;��ȡȨ����
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

;;;��������:	c:AispTools_ZJ/MainFrame/Tree1_Sort#OnClicked
;;;����:
;;;����ֵ
;;;����		�ڵ����� ��ť�����¼�
(defun c:AispTools_ZJ/MainFrame/Tree1_Sort#OnClicked (/)
  (dcl-sendstring "Aisp-ParcelSort ")
)

;;;��������:	c:AispTools_ZJ/MainFrame/Tree1_Delete_ZD#OnClicked
;;;����:
;;;����ֵ
;;;����		����� ��ť�����¼�
(defun c:AispTools_ZJ/MainFrame/Tree1_End_Check#OnClicked (/)
  (dcl-sendstring "Aisp-LastCheck ")
)

;;;��������:	c:AispTools_ZJ/MainFrame/Tree1_Add_ZD#OnClicked
;;;����:
;;;����ֵ
;;;����		�����ڵ� ��ť�����¼�
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

;;;��������:	c:AispTools_ZJ/MainFrame/Tree1_Delete_DJQY#OnClicked
;;;����:
;;;����ֵ
;;;����		ɾ���ؼ����� ��ť�����¼�
(defun c:AispTools_ZJ/MainFrame/Tree1_Delete_DJQY#OnClicked (/ flag)
  (setq flag (dcl-Form-Show AispTools_ZJ/DeleteDJQY))
)

;;;��������:	c:AispTools_ZJ/MainFrame/Tree1_New_DJQY#OnClicked
;;;����:
;;;����ֵ
;;;����		�½��ؼ����� ��ť�����¼�
(defun c:AispTools_ZJ/MainFrame/Tree1_New_DJQY#OnClicked (/ flag )
  (setq flag (dcl-Form-Show AispTools_ZJ/NewDJQY))  
  (cond
    (
     (or (= flag 2) (= flag 4) (= flag 1))
     (dcl-messagebox "������ȡ��" "Aisp��ʾ")
    )
  )
)

;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; AispTools_ZJ/NewDJQY ����
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;;;��������:	c:AispTools_ZJ/NewDJQY/OK#OnClicked
;;;����:
;;;����ֵ
;;;����		AispTools_ZJ/NewDJQY ���� ȷ�� ��ť�¼�
(defun c:AispTools_ZJ/NewDJQY/OK#OnClicked (/ xq djq djzq zdh lxh matchTable)
  (setq	xq   (dcl-Control-GetText AispTools_ZJ/NewDJQY/XQ)
	djq  (dcl-Control-GetText AispTools_ZJ/NewDJQY/DJQ)
	djzq (dcl-Control-GetText AispTools_ZJ/NewDJQY/DJZQ)
	lxh  (dcl-Control-GetText AispTools_ZJ/NewDJQY/SetStartingNumber)
  ) ;;;��ȡ�û���������

  (setq zdh (VL-CATCH-ALL-APPLY 'strcat (list xq djq djzq "JC" "," "0702" "," lxh)))  ;;;���м�������,���һ���ַ���
  
  (setq matchTable (VL-CATCH-ALL-APPLY 'Aisp-GetStrcatLabelList (list "DJQY")))	;;;��ȡ�ؼ����������������ǩ

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
;;;��ѯ�ظ�,�ظ��򲻼�����
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
		   (dcl-messagebox "�벻Ҫ�����ظ��ĵؼ�����!" "Warning")
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
	    "c:AispTools_ZJ/NewDJQY/OK#OnClicked->matchTable \r\n��һ���������"
	  )
	  (dcl-messagebox
	    "c:AispTools_ZJ/NewDJQY/OK#OnClicked->matchTable ��һ���������"
	    "InternalError"
	  )
	)
      )
    )
    (progn
      (DCL-MESSAGEBOX "Error: �����������ֵ" "Aisp��ʾ")
    )
  )
  
  
  (dcl-Form-Close AispTools_ZJ/NewDJQY 3)
)

;;;��������:	c:AispTools_ZJ/NewDJQY/Cancel#OnClicked
;;;����:
;;;����ֵ
;;;����		AispTools_ZJ/NewDJQY ���� ȡ�� ��ť�¼�
(defun c:AispTools_ZJ/NewDJQY/Cancel#OnClicked (/)
  (dcl-Form-Close AispTools_ZJ/NewDJQY 4)
)


;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; AispTools_ZJ/DeleteDJQY   ����
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
(defun c:AispTools_ZJ/DeleteDJQY#OnInitialize (/ label_first_child_handle itemList)
  (setq	label_first_child_handle
;;;�������ľ��
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
	"��δ�����ؼ�����"
      )
      (dcl-Control-SetEnabled AispTools_ZJ/DeleteDJQY/DeleteALL nil)
      (dcl-Control-SetEnabled AispTools_ZJ/DeleteDJQY/Delete nil)
    )
  )
  
)

(defun c:AispTools_ZJ/DeleteDJQY/DeleteALL#OnClicked (/ flag itemList item)	;;;ȫ��ɾ��
  (setq itemList (dcl-Control-GetList AispTools_ZJ/DeleteDJQY/ListBox1))	;;;��ȡlistbox���б�
  (if (/= itemList nil)
    (progn
      (setq flag (dcl-Form-Show AispTools_ZJ/Prompt))
      (cond
	(
	 (= flag 3)
	 (foreach item itemList
;;; ����ɾ��ÿһ��
	   (dcl-Tree-DeleteItem
	     AispTools_ZJ/MainFrame/AispTabStrip_Tree1
	     (dcl-Tree-GetItemHandle
	       AispTools_ZJ/MainFrame/AispTabStrip_Tree1
	       item
	     )
	   )
	 )
	 (dcl-ListBox-Clear AispTools_ZJ/DeleteDJQY/ListBox1)
;;;����б�
	 (dcl-Control-SetEnabled
	   AispTools_ZJ/DeleteDJQY/DeleteALL
	   nil
	 )
;;;���ÿؼ�Ϊ������
	)
	(
	 (or (= flag 1) (= flag 2) (= flag 4))
	 (dcl-messagebox "������ȡ��" "Aisp��ʾ")
	)
      )
    )
  )
)

(defun c:AispTools_ZJ/DeleteDJQY/Delete#OnClicked (/ itemIndex)	;;;����ɾ��
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
;;;��ȡѡ���������
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
;;;ɾ�� �� ����
	     (dcl-ListBox-DeleteItem
	       AispTools_ZJ/DeleteDJQY/ListBox1
	       itemIndex
	     )
;;;ɾ���б�ѡ�����
	   )
	 )
	)
	(
	 (or (= flag 1) (= flag 2) (= flag 4))
	 (dcl-messagebox "������ȡ��" "Aisp��ʾ")
	)
      )
    )
    (progn
      (dcl-messagebox "û�п���ɾ������Ŀ" "Aisp��ʾ")
    )
  )
  
  
)

;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; AispTools_ZJ/Prompt   ����
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
(defun c:AispTools_ZJ/Prompt/OK#OnClicked (/)
  (dcl-Form-Close AispTools_ZJ/Prompt 3)
)

(defun c:AispTools_ZJ/Prompt/Cancel#OnClicked (/)
  (dcl-Form-Close AispTools_ZJ/Prompt 4)
)

;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; AispTools_ZJ/AddParcel   ����
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
(defun c:AispTools_ZJ/AddParcel/ScopeToAdd#OnClicked (/)
  (dcl-Form-Close AispTools_ZJ/AddParcel 3)
)

(defun c:AispTools_ZJ/AddParcel/SingleAdd#OnClicked (/)
  (dcl-Form-Close AispTools_ZJ/AddParcel 4)
)

;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; AispTools_ZJ/SelectDJQY   ����
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
      (dcl-Control-SetText AispTools_ZJ/SelectDJQY/DJQYComboBox "��δ�����ؼ�����")
      (dcl-Control-SetEnabled AispTools_ZJ/SelectDJQY/DJQYComboBox  nil)
    )
  )
  
)

;;; "ȷ��" ��ť�¼�
(defun c:AispTools_ZJ/SelectDJQY/TextButton1#OnClicked (/)
  (setq StaticSelectDJQY (dcl-Control-GetText AispTools_ZJ/SelectDJQY/DJQYComboBox))
  (dcl-Form-Close AispTools_ZJ/SelectDJQY 3)
)

;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; AispTools_ZJ/PayDialog   ����
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;;; "֧������" ��ʼ���¼�
(defun c:AispTools_ZJ/PayDialog#OnInitialize (/)
  ;;;���÷�����ϸ
  (setq DJQYList (Aisp-GetStrcatLabelList "DJQY"))
  (dcl-Control-SetCaption AispTools_ZJ/PayDialog/DJQYTotal (strcat "��ǰ�ܹ����� "  (rtos (length DJQYList) 2 0)  " ���ؼ�����"))
  (setq QSXList (mapcar '(lambda (x) (Aisp-GetStrcatLabelList x)) DJQYList))
  (setq QSXTotal 0)
  (mapcar '(lambda (x) (if (vl-consp x) (setq QSXTotal (+ QSXTotal (length x))))) QSXList)
  (dcl-Control-SetCaption AispTools_ZJ/PayDialog/QSXTotal (strcat "�ܹ���Ҫת�� "  (rtos QSXTotal 2 0)  " ��Ȩ����"))
  (dcl-Control-SetCaption AispTools_ZJ/PayDialog/PayTotal (strcat "���úϼ�Ϊ "  (rtos (* QSXTotal 0.1) 2 2)  " Ԫ"))
  ;;;����������
  (dcl-Control-SetText AispTools_ZJ/PayDialog/ApplicationCodeBox (Aisp-GenApplicationCode))
)

;;;�û���ͼ�رնԻ����¼�
(defun c:AispTools_ZJ/PayDialog#OnCancelClose (Reason /)
  (if (or (= Reason 1) (= Reason 0))
    (dcl-Form-Close AispTools_ZJ/PayDialog)
  )
)

;;;ʹ��֧���� ��ť�¼�
(defun c:AispTools_ZJ/PayDialog/ZFBPay#OnClicked (/)
  (dcl-Form-Show AispTools_ZJ/ZFBPay)
)

;;;ʹ��΢�� ��ť�¼�
(defun c:AispTools_ZJ/PayDialog/WechatPay#OnClicked (/)
  (dcl-Form-Show AispTools_ZJ/WeChatPay)
)

;;;��ʼת�� ��ť�¼�
(defun c:AispTools_ZJ/PayDialog/Transform#OnClicked (/ ApplicationCode AuthorizationCode)
  (setq ApplicationCode (dcl-Control-GetText AispTools_ZJ/PayDialog/ApplicationCodeBox))
  (setq AuthorizationCode (dcl-Control-GetText AispTools_ZJ/PayDialog/AuthorizationCodeBox))
  (if (/= AuthorizationCode "")
    (progn
      (if (Aisp-CalcAuthorizationCode ApplicationCode AuthorizationCode)
	(progn
	  (dcl-Form-Close AispTools_ZJ/PayDialog 5)	;;;������֤ͨ��,���عرմ����־ 5
	)
	(progn
	  (dcl-messagebox "��Ȩ�����!" "Aisp��ʾ")
	)
      )
    )
    (progn
      (dcl-messagebox "����д��Ȩ��!" "Aisp��ʾ")
    )
  )
  
)

;;;opendcl�޷�ʹ�� command ,���ô�����
(defun c:AispRegenzd (/ qsxLayer selectX)
  (setq qsxLayer (dcl-Control-GetText AispTools_ZJ/MainFrame/Frame1_ComboBox2))
  (setq selectX (ssget "X" (list (cons 8 qsxLayer))))
  (command "regenzd" selectX "")
)


;;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;;; �ӹ���
;;;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

;;;��������: Aisp-GetStrcatLabelList
;;;����: Parent_Item_Handle (������)
;;;����ֵ: labelLisr (���������е������ǩ���б�)
;;; ��ȡָ��������һ��������б�
(defun Aisp-GetStrcatLabelList (Parent_Item_Handle / label_first_child_handle label_next_child_item labelList)
  (setq labelList nil)
  (setq	label_first_child_handle
;;;�������ľ��
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
;;;ʹ��ѭ��ÿһ�λ�ȡ��һ��
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

;;;��������: Aisp-CalcAuthorizationCode
;;;����:	ApplicationCode (������) UserAuthorizationCode (�û��������Ȩ��)
;;;����ֵ: ��ȷ T ����ȷ nil
;;; ������Ȩ��,��У���û�������Ȩ���Ƿ���ȷ
(defun Aisp-CalcAuthorizationCode (ApplicationCode UserAuthorizationCode / successful matchList UsetMatchList resultList)
  (setq successful T)
  (setq matchList (mapcar '(lambda (x) (+ (fix (* x 0.8)) 2)) (VL-STRING->LIST ApplicationCode)))	;;;������ȷ����Ȩ��
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



;;;��������: Aisp-GenApplicationCode
;;;����: 
;;;����ֵ: �������ɵ�������
;;; ����������
(defun Aisp-GenApplicationCode (/ DJQYNameList ParcelNumList mergeList totalNum ApplicationCode)
  (setq DJQYNameList (VL-CATCH-ALL-APPLY 'Aisp-GetStrcatLabelList (list "DJQY")))	;;;��ȡ��ǰ�ؼ�����
  (if (not (VL-CATCH-ALL-ERROR-P DJQYNameList))	;;;�Ƿ�������
    (progn
      (setq ParcelNumList (mapcar '(lambda (x) (rtos (length (Aisp-GetStrcatLabelList x)) 2 0)) DJQYNameList))	;;;��õؼ������µ��ڵ�����
      (setq totalNum 0)
      (mapcar '(lambda (x) (setq totalNum (+ totalNum (atoi x)))) ParcelNumList)	;;;��Ҫת����Ȩ��������
      (setq totalNum (VL-LIST->STRING (mapcar '(lambda (x) (+ x 12)) (VL-STRING->LIST (rtos totalNum 2 0)))))	;;;����������
      (setq mergeList (mapcar '(lambda (x y) (strcat x "," y)) DJQYNameList ParcelNumList)) ;;;�ϲ� DJQYNameList ParcelNumList ������
      (setq ApplicationCode "")
      (mapcar '(lambda (x) (setq ApplicationCode (strcat ApplicationCode  x))) mergeList)	;;;�ϲ���ת��Ϊ�ַ���
      (setq ApplicationCode (VL-LIST->STRING (mapcar '(lambda (x) (+ (fix (/ x 0.8)) 1)) (VL-STRING->LIST ApplicationCode))))	;;;�ַ�������
      (setq ApplicationCode (strcat ApplicationCode "*" totalNum))	;;;�ϲ�Ϊ�µ�������
    )
    (progn
      (setq ApplicationCode "Function: Aisp-GenApplicationCode �쳣!����ϵ����!")
    )
  )
  ApplicationCode
)





(dcl-Form-Show AispTools_ZJ/MainFrame)
(if (dcl-Form-IsActive AispTools_ZJ/MainFrame)
  (prompt "\nAispTools �ѳɹ�����! 	-- 2020.12.1	By:const")
  (prompt "\nError: δ�ܳɹ�����! 	-- 2020.12.1	By:const")
)