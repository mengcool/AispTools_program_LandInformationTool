;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<

;;;�ڵ�ת������ʵ�� ��������

;;;<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;; static variable ��̬����
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

(setq StaticSelectDJQY nil)	;;;���ڻ�ȡ AispTools_ZJ/SelectDJQY  ���� �û�ѡ������



(regapp "QHDM")


;;;��������: c:QLR_Check
;;;���ܲ���:
;;;����ֵ:
;;;�����Ҫ����ĸ����߷�Χ��:Ȩ�����Ƿ�Ψһ,�����Ƿ����Ҫ��,������Ҫ��,���Ա�ע
;;;��Ҫ���õ�����ͼ���Ӵ�
;;; successful ֵ��ʾ nil ������� 0 ���ڴ��� 1 �޴��� 2 ����
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
;;;��ȡȨ����ͼ��
  (setq	qsxLayer (dcl-Control-GetText
		   AispTools_ZJ/MainFrame/Frame1_ComboBox2
		 )
  )
;;;��ȡȨ����ͼ��
  (cond
    ((= qlrLayer "")
     (dcl-messagebox "������Ȩ����ͼ��!" "Error:")
     (exit)
    )
    ((= qsxLayer "")
     (dcl-messagebox "������Ȩ����ͼ��!" "Error:")
     (exit)
    )
  )

  ;;;�ж��Ƿ�Ӧ��ִ��Ȩ���˼��
  (setq QSXFlag (dcl-Control-GetPicture AispTools_ZJ/MainFrame/QSXPictureBox))
  (cond
    ((= QSXFlag 100)
      (dcl-messagebox "�����Ȩ���ߵĵĴ���!" "Error:")
      (exit)
    )
    ((= QSXFlag 101)
      (dcl-messagebox "����ִ��Ȩ�������Լ��!!" "Error:")
      (exit)
    )
  )
  
  (if (setq old_ss (ssget "X"
			  (list
			    '(-4 . "<OR")
			    '(8 . "Aisp_Error")
			    '(8 . "qlrLayer")
;;;ɾ��ǰһ�μ������,�������
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
;;;��ȡ��ǰ����
  (setq successful nil flag1 0 flag2 0) ;;; �����ʶ
  (setq	all_ss (ssget "X"
		      (list
			(cons 8 qsxLayer)
		      )
	       )
  )
  (if all_ss
    (progn
      (setq temp_1 0)
      
      (dcl-Form-Show AispTools_ZJ/ProgressBarDialog)  ;;;����������
      (setq total (sslength all_ss))
      
      (dcl-Control-SetMaxValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 total)  ;;;����������
      (repeat total
	(setq ename (ssname all_ss temp_1))
	(setq temp_1 (1+ temp_1))
	
	(dcl-Control-SetValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 temp_1) ;;;����������

	(Aisp-ZoomObject (vlax-ename->vla-object ename)) ;;;���ŵ�Ȩ����
	(setq coor (Aisp-get-coordinate ename))	;;;��ȡȨ���߶˵�����
	(setq centralPoint (AISP-GET-REGION-CENTROID (vlax-ename->vla-object ename)))	;;;��ȡȨ�������ĵ�
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
;;;��ȡFWZJDͼ�����������ַ�
		)
	      )
	    )
	    (if	(and (/= str "") (/= ZHFlag nil))
	      (if (or (/= (rem (strlen str) 2) 0) (> (strlen str) 6))
;;;��һ�����ʳ���Ȩ����������ȡ����,�˴������жϱ���
		(progn
		  (Aisp-Error-Label centralPoint "Ȩ�����������ܴ��ڴ���!")
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
;;;Ȩ���˵�һ�γ��ֲ����"Ȩ����"����
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
		      (Aisp-Error-Label centralPoint "Ȩ������Ȩ����������Ψһ!")
		      (setq flag2 (1+ flag2))
		    )
		  )
		)
	      )
	      (progn
		(Aisp-Error-Label centralPoint "Ȩ��������������!")
		(setq flag2 (1+ flag2))
	      )
	    )
	  )
	  (progn
	    (Aisp-Error-Label centralPoint "Ȩ������Ȩ��������ȱʧ!")
	    (setq flag2 (1+ flag2))
	  )
	)
      )
      (dcl-Form-Close AispTools_ZJ/ProgressBarDialog)
    )
    (progn
      (dcl-messagebox
	"Ȩ����ͼ��Ϊ��!!"
	"Error:"
      )
      (exit)
;;;��������,ǿ���˳�
    )
  )
  (cond
    (
     (and (/= flag1 0) (= flag2 0))
     (setq successful T)
     (dcl-Control-SetPicture AispTools_ZJ/MainFrame/QLRPictureBox 103) ;;;���þ���
     (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox ">>>Warning:���ڿ��ܴ����Ȩ��������,\r\n ����ϸ�˶�,�ɼ���ִ����һ��!")
    )
    (
     (/= flag2 0)
     (setq successful nil)
     (dcl-Control-SetPicture AispTools_ZJ/MainFrame/QLRPictureBox 100) ;;;����δͨ��ͼ��
     (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox ">>>Error:Ȩ���˼��δͨ��,\r\n �����(ͼ��:Aisp_Error)��ע�Ĵ���!")
    )
    (
     (and (= flag1 0) (= flag2 0))
     (setq successful T)
     (dcl-Control-SetPicture AispTools_ZJ/MainFrame/QLRPictureBox 102) ;;;����ͨ��ͼ��
     (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox ">>>Ȩ���˼��ͨ��,\r\n �����ִ����һ������!")
    )
  )
  (gc)
)


;;;��������: c:QSX_Check
;;;���ܲ���:
;;;����ֵ:
;;;����: ���Ȩ�����Ƿ������������
;;;��Ҫ���õ�����ͼ���Ӵ�
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
;;;��ȡȨ����ͼ��
  (setq	qsxLayer (dcl-Control-GetText
		   AispTools_ZJ/MainFrame/Frame1_ComboBox2
		 )
  )
;;;��ȡȨ����ͼ��
  (cond
    ((= qlrLayer "")
     (dcl-messagebox "������Ȩ����ͼ��!" "Error:")
     (exit)
    )
    ((= qsxLayer "")
     (dcl-messagebox "������Ȩ����ͼ��!" "Error:")
     (exit)
    )
  )

  (if (setq old_ss (ssget "X"
			  (list
			    '(-4 . "<OR")
			    '(8 . "Aisp_Error")
;;;ɾ��ǰһ�μ������,�������
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
      (dcl-Form-Show AispTools_ZJ/ProgressBarDialog)  ;;;����������
      
      (setq total (sslength all_ss))

      (dcl-Control-SetMaxValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 total)  ;;;����������
      (repeat total
	(setq vlaObject (vlax-ename->vla-object (ssname all_ss counter)))
	(setq counter (1+ counter))
	
	(dcl-Control-SetValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 counter) ;;;����������
	
	(if (not (Aisp-Check-PolylineTopology vlaObject))
	  (progn
	    (setq flag (1+ flag))
	  )
	)
      )
      (dcl-Form-Close AispTools_ZJ/ProgressBarDialog)
    )
    (progn
      (dcl-messagebox "Ȩ����ͼ��Ϊ��!" "Error:")
      (exit)
    )
  )
  
  (if (= flag 0)
    (progn
      (dcl-Control-SetPicture AispTools_ZJ/MainFrame/QSXPictureBox 102) ;;;���� ͨ�� ͼ��
      (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox ">>>Ȩ���߼��ͨ��,\r\n �����ִ����һ��Ȩ���˼��")
    )
    (progn
      (dcl-Control-SetPicture AispTools_ZJ/MainFrame/QSXPictureBox 100) ;;;���� δͨ�� ͼ��
      (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox ">>>Error:Ȩ���߼��δͨ��,\r\n �����(ͼ��:Aisp_Error)��ע�Ĵ���!")
    )
  )
  
  (gc)
)


;;;��������: c:Aisp-ScopeToAddParcel
;;;���ܲ���:
;;;����ֵ:�ɹ����� T,���򷵻� nil 
;;;��������: 
;;;����: 
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
  (setq flag (dcl-Form-Show AispTools_ZJ/SelectDJQY))	;;;��ʾ ѡ��ؼ����� ����
  (cond
    (
     (= flag 3)
     (setq djqy StaticSelectDJQY)
    )
    (
     (or (= flag 1) (= flag 2))
     (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox "��ѡ����ӵĵؼ�����!")
    )
  )
  (setq	qsxLayer (dcl-Control-GetText
		   AispTools_ZJ/MainFrame/Frame1_ComboBox2
		 )
  )
;;;��ȡȨ����ͼ��
  (if (and (/= qsxLayer "") (/= djqy nil) (/= djqy "��δ�����ؼ�����"))
    (progn
      (if (setq	old_ss (ssget "X"
			      (list
				'(-4 . "<OR")
				'(8 . "Aisp_Error")
				
;;;ɾ��ǰһ�μ������,�������
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
	       (car (entsel "\n��ѡ��Χ��:"))
	     )
      )
      (if (/= polylineObject nil)
	(progn
	  (setq	polylineCoord
		 (Aisp-Get-AcDbPolyline-Coordinate
		   polylineObject
		 )
	  )
;;;��ȡ��Χ�߶˵�����

	  (setq acadObj (vlax-get-acad-object))
;;;��������Χ���Ӵ�
	  (vla-GetBoundingBox polylineObject 'minExt 'maxExt)
	  (vla-ZoomWindow acadObj minExt maxExt)

	  (setq	selectWP (ssget "WP"
;;;���ڵغ��·��������Ŵ���,�ؼ�����
			      polylineCoord
			      (list 
				    (cons 8 qsxLayer)
			      )
		       )
	  )
	  (setq	selectCP (ssget "CP"
;;;��ؼ�����Χ�߽���Ķ���
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
	      (repeat (sslength selectCP)	;;;��齻��ʵ��
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
		    (setq crossEntityList (VL-REMOVE-IF '(lambda (x) (= x objectHandle)) crossEntityList))	;;;��齻��ʵ��
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
	      (if (/= crossEntityList nil)	;;;�Խ����ڵ�ʵ����б�ע
		(progn
		  (foreach crossEntity crossEntityList
		    (setq centroid (AISP-GET-REGION-CENTROID (vlax-ename->vla-object (HANDENT crossEntity))))
		    (AISP-ERROR-LABEL centroid "��ؼ����򽻲���ڵ�ʵ��")
		  )
		)
              )
	      (setq successful T)
	    )
	    (progn
	      (dcl-messagebox "��Χ����δ�ҵ�����Ҫ���Ȩ����,��ȷ���Ƿ�ѡ����ȷ" "Aisp��ʾ")
	    )
	  )
	  
	)
      )
    )
    (progn
      (dcl-messagebox "������Ȩ����ͼ����ؼ�����!" "Aisp��ʾ")
    )
  )
  
  (setq StaticSelectDJQY nil)
  successful
  (gc)
)

;;;��������: c:Aisp-SingleAddParcel
;;;���ܲ���: 
;;;����ֵ:�ɹ����� T,���򷵻� nil 
;;;��������:
;;;����: ��������ڵ�ʵ��
(defun c:Aisp-SingleAddParcel (/ successful flag djqy qsxLayer polylineObject objectHandle)
  (setq successful nil)
  (setq flag (dcl-Form-Show AispTools_ZJ/SelectDJQY))	;;;��ʾ ѡ��ؼ����� ����
  (cond
    (
     (= flag 3)
     (setq djqy StaticSelectDJQY)
    )
    (
     (or (= flag 1) (= flag 2))
     (dcl-Control-SetText AispTools_ZJ/MainFrame/MessageBox "��ѡ����ӵĵؼ�����!")
    )
  )
  (setq	qsxLayer (dcl-Control-GetText
		   AispTools_ZJ/MainFrame/Frame1_ComboBox2
		 )
  )
;;;��ȡȨ����ͼ��
  (if (and (/= qsxLayer "") (/= djqy nil) (/= djqy "��δ�����ؼ�����"))
    (progn
      (setq polylineObject
	     (vlax-ename->vla-object
	       (car (entsel "\n��ѡ�񵥶����ڵ�ʵ��:"))
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
	    (dcl-messagebox (strcat "������ڵ�ʵ�嵽" djqy "�ؼ�����") "Aisp��ʾ")
	    (dcl-messagebox "�벻Ҫ����ظ����ڵ�ʵ��!" "Aisp��ʾ")
	  )
	)
	(progn
	  (dcl-messagebox "�Ⲣ�����������ڵ�ʵ��!" "Aisp��ʾ")
	)
      )
    )
    (progn
      (dcl-messagebox "������Ȩ����ͼ����ؼ�����!" "Aisp��ʾ")
    )
  )
  (setq StaticSelectDJQY nil)
  successful
  (gc)
  (princ)
)

;;;��������: c:Aisp-ParcelSort
;;;���ܲ���: 
;;;����ֵ:
;;;��������: 
;;;����: �������οؼ��ṩ����Ϣ,���ڵؽ�����ˮ�ű���
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
;;;ɾ��ǰһ�μ������,�������
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
;;;��ȡȨ����ͼ��
  (setq QSXFlag (dcl-Control-GetPicture AispTools_ZJ/MainFrame/QSXPictureBox))	;;;�ж�Ȩ���߼���Ƿ�ͨ��
  (setq QLRFlag (dcl-Control-GetPicture AispTools_ZJ/MainFrame/QLRPictureBox))	;;;�ж�Ȩ���˼���Ƿ�ͨ��
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
      )		;;;����Ƿ������δ����ڵ�ʵ��ĵؼ�����
      (if (not (vl-remove-if-not '(lambda (x) (= x nil)) matchList))
	(progn
	  (setq acadObj (vlax-get-acad-object))
          (vla-ZoomAll acadObj)	;;;�����ӿڵ�ȫ��

	  (dcl-Control-SetEnabled AispTools_ZJ/MainFrame/Tree1_End_Check T)	;;;���� "ת��ǰ�����" ��ťΪ����
	  
	  (dcl-Form-Show AispTools_ZJ/ProgressBarDialog)  ;;;����������
	  (dcl-Control-SetMaxValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 (length DJQYList))  ;;;����������
	  (setq ProgressCounter 0)

	  
	  (foreach DJQY DJQYList
	    (dcl-Control-SetValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 (setq ProgressCounter (1+ ProgressCounter))) ;;;����������
	    (setq sortList nil)		;;;���������Ϊnil
	    (setq handleList (Aisp-GetStrcatLabelList DJQY))
	    
	    (foreach handle handleList
	      (setq QSXVlaName (vlax-ename->vla-object (handent handle)))
	      (AISP-ZOOMOBJECT QSXVlaName) ;;;���ŵ�Ȩ����
	      (setq QSXcoordLIst (AISP-GET-ACDBPOLYLINE-COORDINATE QSXVlaName))	;;;��ȡȨ���߶˵�����
	      (setq QSXCentroidPt (AISP-GET-REGION-CENTROID QSXVlaName))	;;;��ȡȨ��������
	      (setq selectCP (ssget "CP" QSXcoordLIst (list (cons 8 qlrLayer))))
	      (setq qlrVlaName (vlax-ename->vla-object (ssname selectCP 0)))	;;;��ȡȨ����
	      (setq ZHStr (VL-CATCH-ALL-APPLY 'vlax-get-property (list qlrVlaName 'TextString)))	;;;��ȡȨ�����������
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
				     );;;���ĵ�����0.2
				   )
			  )
		   )
		  (setq sortList (cons (list ZHStr (list (cdr (assoc 5 (entget (entlast)))) ZHStrCoord)) sortList))
		)
		(progn
		  (vla-put-ConstantWidth QSXVlaName 2)
		  (dcl-messagebox "c:Aisp-ParcelSort->ZHStr \n �쳣" "Aisp��ʾ")
		  (exit)
		)
              )
	    )

	    (setq ZHList nil)	;;;��ǰ�ؼ�������������
	    (setq tempZHList (mapcar '(lambda (x) (car x)) sortList))
	    (foreach tempZH tempZHList
	      (if (not (VL-REMOVE-IF-NOT '(lambda (x) (= x tempZH)) ZHList))
		(setq ZHList (cons tempZH ZHList))
	      )
	    )

	    ;;;���濪ʼ��ˮ�ű���
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
	      )   ;;;���ϵ���,����  (ģ������)
	      (setq singleZHList
		     (vl-sort singleZHList
			      '(lambda (a1 a2)
				 (> (cadr (cadr a1)) (cadr (cadr a2)))
			       )
		     )
	      )  ;;;��������,���� (��ȷ����)

	      (setq startNum (atoi (nth 2 (AISP-SEPARATOR-SUBSTR DJQY ","))))	;;;ȡ�����οؼ��ڵ���ˮ��
	      (setq counter2 0)
	      (repeat (length singleZHList)
		(cond	;;;������ˮ��Ϊ�ַ���
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
		(setq ename (HANDENT (car (nth counter2 singleZHList))));;;�������ͼԪ��
		(setq Ob_name (vlax-ename->vla-object ename));;;ת��VLA����
		(setq old_str (vla-get-TextString Ob_name))
		(vla-put-TextString Ob_name (strcat old_str LXH));;;���¶�����������
		(setq STARTNUM (1+ STARTNUM));;;��ˮ�ŵ���
		(setq counter2 (1+ counter2));;;����������
	      )
	    )
	  )
	  (dcl-Form-Close AispTools_ZJ/ProgressBarDialog)
	)
	(progn
	  (dcl-messagebox "Warning:������δ����ڵ�ʵ��ĵؼ����� \n       ����ĵؼ�������ɾ��" "Aisp��ʾ")
	)
      )
    )
    (progn
      (dcl-messagebox "Ȩ���߻���Ȩ���˼��δͨ��!" "Aisp��ʾ")
    )
  )
  (gc)
  (princ)
)

;;;��������: c:Aisp-LastCheck
;;;���ܲ���: 
;;;����ֵ:
;;;��������: 
;;;����: ��һ�μ�����������Ƿ�ϸ�
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
;;;ɾ��ǰһ�μ������,�������
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
  
  (setq DJQYList (Aisp-GetStrcatLabelList "DJQY"))	;;;������οؼ������еĵؼ�������
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
;;;        (vla-ZoomAll acadObj)	;;;�����ӿڵ�ȫ��
	(dcl-Form-Show AispTools_ZJ/ProgressBarDialog)	;;;��ʾ������

	(setq ProgressCounter 0)
	(foreach handleItem handleList
	  (dcl-Control-SetValue AispTools_ZJ/ProgressBarDialog/ProgressBar1 (setq ProgressCounter (1+ ProgressCounter)))
	  
	  (setq	qsxVlaName
		 (vlax-ename->vla-object (handent handleItem))
	  )
	  (Aisp-ZoomObject qsxVlaName) ;;;���ŵ�Ȩ����
	  (setq
	    qsxCoord (AISP-GET-ACDBPOLYLINE-COORDINATE qsxVlaName)
	  ) ;;;ȡ��Ȩ���߶˵�����
	  (setq centroid (AISP-GET-REGION-CENTROID qsxVlaName))
	  (setq qsxSelectCP (ssget "CP" qsxCoord (list '(-4 . "<OR")
						       '(8 . "ParcelNumLayer")
						       '(8 . "qlrLayer")
						       '(-4 . "OR>")
						       )))
	  (if (/= qsxSelectCP nil)
	    (progn
	      (setq counter2 0)	;;; �ж�Ȩ�����ڵ�ʵ��
	      (setq qlrFlag 0 ZDHFlag 0)	;;;���ó��ִ���Ϊ0
	      (repeat (sslength qsxSelectCP)
		(setq CPVlaName (vlax-ename->vla-object (ssname qsxSelectCP counter2)))
		(setq counter2 (1+ counter2))
		(setq CPLayer (vlax-get-property CPVlaName 'Layer))
		(cond
		  (
		   (= CPLayer "qlrLayer")
		   (setq qlrFlag (1+ qlrFlag))	;;;���ó��ִ���
		  )
		  (
		   (= CPLayer "ParcelNumLayer")
		   (setq ZDHFlag (1+ ZDHFlag))	;;;���ó��ִ���
		  )
		)
	      )
	      
	      (if (and (/= qlrFlag 1) (/= ZDHFlag 1))
		(progn
		  (AISP-ERROR-LABEL centroid "ȱ���ڵغŻ�Ȩ����!")
		  (setq errorFlag (1+ errorFlag))	;;;���ִ���Ĵ���
		)
	      )
	    )
	    (progn
	      (AISP-ERROR-LABEL centroid "ȱ���ڵغź�Ȩ����!")
	      (setq errorFlag (1+ errorFlag))	;;;���ִ���Ĵ���
	    )
	  )
	)
      )
    )
  )

  (dcl-Form-Close AispTools_ZJ/ProgressBarDialog)	;;;�رս�����
  
  (if (= errorFlag 0)
    (progn
      (dcl-Control-SetEnabled AispTools_ZJ/MainFrame/Tree1_Transform T)	;;;û�д�������"��ʼת��"��ťΪ����
      (dcl-messagebox "���Ժϸ�" "Aisp��ʾ")
    )
    (progn
      (dcl-messagebox "���ڴ���,�����" "Aisp��ʾ")
    )
  )

  (gc)
  (princ)
)


;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<

;;;�ӳ��� ��������

;;;<<<<<<<<<<<<<<<<<<<<<<<
;;;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;;;��������: Aisp-Check-PolylineTopology
;;;���ܲ���: vlaObject (����߶���)
;;;����ֵ:�ɹ����� T,���򷵻� nil 
;;;��������: Aisp-Error-Label AISP-GET-REGION-CENTROID Aisp-Get-AcDbPolyline-Coordinate
;;;����: ������߶����Ƿ������������,�Դ������������δ�պϵĶ���߽��б�ע,
(defun Aisp-Check-PolylineTopology (vlaObject / successful object_table MSpace indetermination coord)
  (setq successful nil)
  (setq repeatPoint nil)
  (if (= "AcDbPolyline" (vlax-get-property vlaObject 'ObjectName))
    (progn
      (setq coordList (Aisp-Get-AcDbPolyline-Coordinate vlaObject)) ;;;��ȡ����߶˵�����
      ;;;����Ƿ�����ظ��˵�
      (foreach coord coordList
	(setq tempList (cdr (member coord coordList)))
	(if (member coord tempList)
	  (setq repeatPoint T)
	)
      )

      (if (/= (vla-get-elevation vlaObject) 0)	;;;���ñ��Ϊ 0
	  (progn
	    (vla-put-elevation vlaObject 0)
	  )
      )
      
      (setq MSpace (vla-get-ModelSpace
		     (vla-get-ActiveDocument (vlax-get-acad-object))
		   )
      )
;;;���ģ�Ϳռ�

      (setq object_table (vlax-make-safearray vlax-vbObject '(0 . 0)))
;;;������������
      (vlax-safearray-fill object_table (list vlaObject))
;;;����������

      (setq indetermination
	     (VL-CATCH-ALL-APPLY
	       'vlax-invoke-method
	       (list MSpace
		 'AddRegion
		 object_table
		)
	     )
      ) ;;;��������,�����������
      (if (not (VL-CATCH-ALL-ERROR-P indetermination)) 
	(progn
	  (ENTDEL (entlast))
	  (if (/= repeatPoint T) ;;;�ж��ظ��˵�
	    (progn
	      (if (= (vlax-get-property vlaObject 'Closed) :vlax-true)
;;;����Ƿ�պ�
		(progn
		  (setq successful T)
		)
		(progn
		  (Aisp-Error-Label
		    (AISP-GET-REGION-CENTROID vlaObject)
		    "Ȩ����δ�պ�!"
		  )
		)
	      )
	    )
	    (progn
	      (Aisp-Error-Label (nth 0 coordList) "Ȩ���ߴ����ظ��˵�!")
	    )
	  )
	)
	(progn
	  (vla-put-ConstantWidth vlaObject 1.25)
	  (Aisp-Error-Label (nth 0 coordList) "Ȩ���ߴ������˴���!")
	)
      )
      (vlax-release-object MSpace)
    )
    (progn
      (setq successful nil)
    )
  )
;;;�ͷſռ�
  (gc)
  successful
)

;;;��������: Aisp-Error-Label
;;;���ܲ���: labelPoint (��ע��) labelContent (��ע����)
;;;����ֵ:
;;;����: ���ݱ�ע��������ݱ�ע
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

;;;��������: Aisp-GetSpecifiedItemAllChild
;;;����: SpecifiedItemHandle (ָ����ľ�����)
;;;����ֵ: ResultList (����һ������������ɵ��б�)
;;;        �б���ʽ:(list
;;;		     Parcel Child1 Child2 Child3 .....
;;;		     Parce2 Child1 Child2 Child3 .....
;;;		      ....
;;;		    )
;;; ��ȡָ��������������ı�ǩ(�������������)
(defun Aisp-GetSpecifiedItemAllChild (SpecifiedItemHandle / ResultList first_Child_handle first_Child_label next_Child_handle label)
  (setq ResultList nil)
  (setq	first_Child_handle
	 ;;;��ȡ����ľ��
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
;;;��ȡ����ı�ǩ
	     (dcl-Tree-GetItemLabel
	       AispOpenDCL/AispMain/AispTabStrip_Tree
	       first_Child_handle
	     )
      )
      (setq ResultList (cons first_Child_label ResultList))
      (setq next_Child_handle first_Child_handle)
      (while (setq next_Child_handle
;;;ʹ��ѭ��ÿһ�λ�ȡ��һ��
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

;;;��������:Aisp-Make-Parcel-Line
;;;���ܲ���:parcel_name(�ڵ�ͼԪ��),obligee(Ȩ����),QHDM_number(���Ŵ���),parcel_number(�ڵغ�),land_type(��������)
;;;����ֵ:successful,�ɹ�����"T",ʧ�ܷ���"nil"
;;;����ͼԪ��,Ȩ����,���Ŵ���,�ڵغ�,������,����������ɫΪ��ɫ,���ɽ�ַ��
;;;��ע:�б�Ҫע��һ��������(regapp "QHDM")
(defun Aisp-Make-Parcel-Line (parcel_name  obligee  QHDM_number
			      parcel_number  land_type
			      / ls south_ls successful new_ls
			     )
	(setq successful nil)
	
	(setq vlaName (vlax-ename->vla-object parcel_name))	;;;ת��Ϊvla����
	(setq DataType (vlax-make-safearray vlax-vbInteger '(0 . 6)))  ;;;xdata��������
    (setq Data (vlax-make-safearray vlax-vbVariant '(0 . 6)))  ;;;xdataֵ����
	
	;;;��ʼ�������
	(setq errorFlag1 (vl-catch-all-apply 'vlax-safearray-fill (list DataType (list 1001 1000 1001 1000 1000 1000 1000))))
	(setq errorFlag2(vl-catch-all-apply 'vlax-safearray-fill (list Data (list "QHDM" QHDM_number "SOUTH" "300000" parcel_number obligee land_type))))
	
	;;;д����չ����
	(if (and
	      (not (vl-catch-all-error-p errorFlag1))
	      (not (vl-catch-all-error-p errorFlag2))
	    )
	  (progn
	    (vla-setxdata vlaName DataType Data)
;;;���ö�����ɫΪ��ɫ
	    (vla-put-Color vlaName acRed)
	    ;;;����Ȩ����ͼ����"JZD"
	    (vla-put-layer vlaName "JZD")
	    (setq successful T)
	  )
	)


    successful
)

;;;��������: Aisp-ZoomObject
;;;���ܲ���: VlaObject (���ŵ���vla����)
;;;����ֵ:
;;;���ŵ�ָ���Ķ���
(defun Aisp-ZoomObject (VlaObject / flag)
;;;��ȡACAD����
  (setq acadapplic (vlax-get-acad-object))
;;;��ö���߽�Խǵ�
  (setq	flag (VL-CATCH-ALL-APPLY
	       'vla-GetBoundingBox
	       (list VlaObject 'minExt 'maxExt)
	     )
  )
  (if (not (VL-CATCH-ALL-ERROR-P flag))
    (progn
;;;��ת���ö���
      (vla-ZoomWindow acadapplic minExt maxExt)
    )
  )
  (vlax-release-object acadapplic)
)