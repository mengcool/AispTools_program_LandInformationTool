
;;;									��������һ����:

;;;	ifdef

;;;									�����㷨��غ���

;;;��������:  Aisp-Get_center_relative
;;;����:   ename(ͼԪ��)
;;;����ֵ:  MJ:MIDPOINT(list���ĵ�)
;;;��������������ĵ�

;;;��������: Aisp-Get-Region-Centroid
;;;����: Vla_Object vla����
;;;����ֵ: Centroid �ɹ�����:��������  ʧ�ܷ���nil
;;;��ö�������

;;;��������:  Aisp-Get-AcDbPolyline-Coordinate
;;;����: Object_name (vla����)
;;;����ֵ: coor_ls
;;;��ȡ��������,������

;;;��������: Aisp-Judge-IsInPolygon
;;;����: checkPoint (������) polygonPoints (����������)
;;;����ֵ: successful �����ڶ������,���� T ���� ���� nil
;;;�����Ƿ���ڶ������(���� �ڲ�, �ڱ���)

;;;��������:  Aisp-Get-Coordinate
;;;���ܲ���:enameͼԪ������ȡ��ͼԪ����
;;;����ֵ:����һ�������:coordinate_list
;;;����:��ȡʵ������,������һ����.

;;;��������:Aisp-isSegmentsIntersectant
;;;���ܲ���:segA,segB ���ݸ�ʽ'((xxx xxx) (xxx xxx))
;;;����ֵ:return "T"�ཻ "nil"���ཻ
;;;����:�ж��߶ν���,�˵�������ͬ���ж�

;;;��������: Aisp-Rand
;;;����: bottom (��Сֵ)  top (���ֵ)
;;;����ֵ:
;;;���������

;;;��������: Aisp-Judge-PolylineDirection 
;;;����: Vla_name
;;;����ֵ: Result (0. �������ʹ��� 1. ˳ʱ�� 2. ��ʱ��)
;;;�ж϶���߻�ͼ����,˳ʱ��,��ʱ��

;; | GE_PtInPoly
;; | -----------------------------------------------------------------------------
;; | Function : Detects if a point is within a closed polygon.  This is done by
;; |   drawing a line from pt to x+ direction and count the number of
;; |   times it cuts the polygon under test. An even number of cut
;; |   indicates that the pt is outside the polygon.
;;	����:���һ�����Ƿ���һ����յĶ������

;; | GE_PtOutsideAllPoly
;; | ----------------------------------------------------------------------------
;; | Function : Detects if a point falls outside each of a set of closed polygons
;;		���һ�����Ƿ�����ÿ����ն���μ��ϵ�����


;;;									OpenDcl������غ���

;;;��������:  Aisp-Load_ODCL_Project
;;;������projname = ���������ִ�(��׺Ϊ"*.odcl"��"*.odcl.lsp"�򲻴���׺)����OpenDcl�������ݱ�
;;;      reload =  T ǿ�����ع��� or nil ���Ѽ��أ���ʲôҲ����
;;;      password = �趨�����ִ� or nil
;;;      alias = �����Ŀ�ؼ��� or nil
;;;����ֵ:
;;;����OpenDcl����

;;;��������: Aisp-AutoLoadODclArx
;;;����: RuntimePath (OpenDCL���п�洢·��) Ϊ nil ʱ,��CAD֧��·������
;;;����ֵ: loaded (1 3 ��ʾ���سɹ� 2 ��ʾ����ʧ��)
;;;�Զ�����OpenDcl����




;;;									�ַ���غ���

;;;��������: Aisp-Separator-Substr
;;;����: str (�ַ���) separator (�ָ���)
;;;����ֵ: new_str_ls (�ַ�����)
;;;ָ���ָ���,�ָ��ַ�,����һ���ָ���ɵ��ַ���

;;;��������: XD::String:RegExpS
;;;����:    pat = ������ʽģʽ ,��Ӧvbs������ʽ��ģʽ(expression)��˵��: \\��Ҫ��\\\\���.
;;; 	    str = �ַ���
;;; 	    key = \"i\" \"g\" \"m\" , \"i\"�����ִ�Сд��Ignorecase��,\"g\"ȫ��ƥ�䣨Global��.
;;;           \"m\"����ģʽ��Multiline�������ϼ����ؼ��ֿ������ʹ�ã����� \"\".
;;;����ֵ:  ����ƥ����ַ��б�����һƥ�䷵��nil
;;����: ���ַ�������������ʽƥ�����.

;;;��������: Aisp-get-Chinese
;;;����:    str (��Ҫ�ָ���ַ���)
;;;����ֵ:  ������ȡ���������ַ�
;;����: ���ַ�������������ʽƥ�����.��ȡ���е������ַ�


;;;									Windows_ActiveX��غ���

;;;��������: Aisp-GetFilePath
;;;���ܲ���: msg(��Ϣ��ʾ����)
;;;����ֵ: path(�ļ�·��)
;;;���_�ļ���·��

;;;��������: Aisp-Voice
;;;����: ��
;;;����ֵ: ��
;;;����ת������

;;;��������: Aisp-Get-GUID
;;;����: ��
;;;����ֵ: ��
;;;����GUID��ȫ��Ψһ��־�룩
;;;����ļ���

;;;��������: Aisp-GetFilePath
;;;���ܲ���: msg(��Ϣ��ʾ����)
;;;����ֵ: path(�ļ�·��)
;;;���_�ļ���·��

;;;									���ܼ���غ���

;;;��������: Aisp-Selection-Set  (�ѷ���)
;;;����:  mode (ѡ��ģʽ) pt_list (ѡ��Χ���):��ѡ����  filter_list (�������˱�):��ѡ����
;;;����ֵ: ename_table (ѡ��Χ�ڵ�ͼԪ�����)
;;;ȡ��Ŀ��ѡ���ڵ�ͼԪ�����
;;;	enddef

;;;��������: Aisp-Make-DistanceLabel
;;;����: Vla-Object (POLYLINE_vla����) Text_Height (���ָ߶�) Text_gap (���ֵ��߾���)  Text_mode (��ע�ڲ�1���ⲿ 2)
;;;����ֵ: successful 
;;;��ע����ξ���,�պ϶����, ��������: Aisp-Judge-PolylineDirection

;;;��������: Aisp-Judge-Label
;;;����: polygon_coord_ls ����������
;;;����ֵ; result_ls �ɹ����� �ߵ���� ʧ�ܷ��� nil
;;;�ж϶������Ҫ��עǽ��ı�,�жϾ����Ժܴ�
;;;��������: Aisp-Get-AcDbPolyline-Coordinate


;;;									�ļ�������غ���

;;;��������: Aisp-Find-File
;;;����: parent_file_path (���ļ�·��) pattern (ģʽ�ַ�)
;;;����ֵ: file_path_table (�ļ�·����)
;;;����ָ���ļ���Ŀ¼��,�����������ļ������������ļ�Ŀ¼�·����������ļ���·��,�ݹ����


;;;����VL��չ
(vl-load-com)



;;;
;;;						������������¿�ʼ:
;;;



;;;��������:  Aisp-Get_center_relative
;;;����:   ename(ͼԪ��)
;;;����ֵ:  MJ:MIDPOINT(list���ĵ�)
;;;��������������ĵ�
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
	(MJ:MIDPOINT (car pt) (cadr pt));����ֵ
      )
      (MJ:MIDPOINT (car lst) (cadr lst));����ֵ
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


;;;��������:  Aisp-Load_ODCL_Project
;;;������projname = ���������ִ�(��׺Ϊ"*.odcl"��"*.odcl.lsp"�򲻴���׺)����OpenDcl�������ݱ�
;;;      reload =  T ǿ�����ع��� or nil ���Ѽ��أ���ʲôҲ����
;;;      password = �趨�����ִ� or nil
;;;      alias = �����Ŀ�ؼ��� or nil
;;;����ֵ:
;;;����OpenDcl����
(defun Aisp-Load_ODCL_Project
       (projname reload password alias / bytes rtype Projects e)
  (cond
    ((null dcl_project_import)
     (prompt "OpenDCLδ����...\n")
    )
    ((= 'list (type projname)) ;_ projname ΪOpenDcl�������ݱ�
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
     ) ;_ �Ӵ������Դ�ļ��ж�ȡOpenDCL����
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
    ;;����OpenDCL�����ļ����м���
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

;;;��������: Aisp-AutoLoadODclArx
;;;����: RuntimePath (OpenDCL���п�洢·��) Ϊ nil ʱ,��CAD֧��·������
;;;����ֵ: loaded (1 3 ��ʾ���سɹ� 2 ��ʾ����ʧ��)
;;;�Զ�����OpenDcl����
(defun Aisp-AutoLoadODclArx (RuntimePath / loaded fn v fnn)
  (cond
    ((VL-FILE-DIRECTORY-P RuntimePath)
     (if (not dcl_getversionex) ;_ OpenDcl��δ����
	;;��AutoCAD�Ĳ�ͬ�汾����opendcl.arx�ļ����м���
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
	   (if (= "x86" (getenv "PROCESSOR_ARCHITECTURE")) ;_ 32λϵͳ
	     (if (setq fnn
			(strcat RuntimePath "\\" (setq fn (strcat "OpenDCL." v ".arx")))
		 )
	       (setq loaded (arxload fnn "1"))
	       (setq loaded "2")
	     )
	     ;;64λϵͳ
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
	(setq loaded "3") ;_ �Ѽ���
      )
    )
    ((= RuntimePath nil)
      ;;ϵͳ�Ѱ�װOpenDcl�ļ��ط�ʽ
      (if (and
	    (not dcl_getversionex) ;_ OpenDclδ����
	    (= 2 (boole 1 (getvar "DEMANDLOAD") 2))
	  )
	(VL-CATCH-ALL-APPLY 'vl-cmdf (list "opendcl")) ;_ ����OpenDcl�������OpenDcl
      )
      (if (not dcl_getversionex) ;_ OpenDcl��δ����
	;;��AutoCAD�Ĳ�ͬ�汾����opendcl.arx�ļ����м���
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
	   (if (= "x86" (getenv "PROCESSOR_ARCHITECTURE")) ;_ 32λϵͳ
	     (if (setq fnn
			(findfile (setq fn (strcat "OpenDCL." v ".arx")))
		 )
	       (setq loaded (arxload fnn "1"))
	       (setq loaded "2")
	     )
	     ;;64λϵͳ
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
	(setq loaded "3") ;_ �Ѽ���
      )
      ;; ����OpenDclʧ�ܣ�ֱ���жϳ���
      (if (= "1" loaded)
	(progn
	  (princ (strcat fn "����ʧ�ܣ������˳���"))
	  (exit)
	)
	(if (= "2" loaded)
	  (progn
	    (princ
	      (strcat "δ�ҵ���Ӧ��\"" fn "\"�ļ��������˳���")
	    )
	    (exit)
	  )
	)
      )
    )
  )
  ;;����3����ʾ���سɹ�
  loaded
)


;;;��������: Aisp-GetFilePath
;;;���ܲ���: msg(��Ϣ��ʾ����)
;;;����ֵ: path(�ļ�·��)
;;;���_�ļ���·��
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


;;��������:  Aisp-Get-AcDbPolyline-Coordinate
;;;����: Object_name (vla����)
;;;����ֵ: coor_ls
;;;��ȡ��������,������
(defun Aisp-Get-AcDbPolyline-Coordinate (Object_Name / coordinates temp coor coor_ls)
  (setq	coordinates
	 (vlax-safearray->list
	   (vlax-variant-value (vla-get-coordinates Object_Name))
	 )
  )				;;;��ȡ����,����ת����ȫ����,����ת��list
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

;;;��������: Aisp-Judge-IsInPolygon
;;;����: checkPoint (������) polygonPoints (����������)
;;;����ֵ: successful �����ڶ������,���� T ���� ���� nil
;;;�����Ƿ���ڶ������(���� �ڲ�, �ڱ���)
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


;;;��������: Aisp-Rand
;;;����: bottom (��Сֵ)  top (���ֵ)
;;;����ֵ:
;;;���������
(defun Aisp-Rand (bottom top / value)
  (setq value (+ (rem (getvar "CPUTICKS") (- top bottom)) bottom))
)

;;;��������: Aisp-Separator-Substr
;;;����: str (�ַ���) separator (�ָ���)
;;;����ֵ: new_str_ls (�ַ�����)
;;;ָ���ָ���,�ָ��ַ�,����һ���ָ���ɵ��ַ���
(defun Aisp-Separator-Substr (str separator / str_ls child_ls str_ls new_str_ls)
  (setq separator_ascii (ascii separator))	;;;��ȡ�ַ�ASCII��
  (setq strs (VL-STRING->LIST str))	;;;ת��Ϊlist
  (setq	child_ls nil
	str_ls nil
	new_str_ls nil
  )

  (foreach str_temp strs		;;;����ȡ��ÿһ����
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
  
  (setq child_ls (reverse child_ls))	;;;���һ���ָ����޷������,�ڴ˼���
  (setq str_ls (cons child_ls str_ls))
  (setq str_ls (reverse str_ls))
  
  (foreach str_temp str_ls		;;;��תΪΪ�ַ�
    (setq str_temp (VL-LIST->STRING str_temp))
    (setq new_str_ls (cons str_temp new_str_ls))
  )
  
  (setq new_str_ls (reverse new_str_ls))	;;;���ñ�,��������˳��
)

;;;��������:Aisp-isSegmentsIntersectant
;;;���ܲ���:segA,segB ���ݸ�ʽ'((xxx xxx) (xxx xxx))
;;;����ֵ:return "T"�ཻ "nil"���ཻ
;;;����:�ж��߶ν���,�˵�������ͬ���ж�
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

;;;��������:  Aisp-Get-Coordinate
;;;���ܲ���:enameͼԪ������ȡ��ͼԪ����
;;;����ֵ:����һ�������:coordinate_list
;;;����:��ȡʵ������,������һ����.
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

;;;��������: Aisp-Voice
;;;����: ��
;;;����ֵ: ��
;;;����ת������
(defun Aisp-Voice (/ objTTS)
  (setq objTTS (vlax-create-object "SAPI.SpVoice"))
  (vlax-invoke objTTS 'speak "Hello,everyone!")
  (vlax-release-object objTTS)
  (princ)
)

;;;��������: Aisp-Get-GUID
;;;����: ��
;;;����ֵ: ��
;;;����GUID��ȫ��Ψһ��־�룩
;;;����������Ϊ����ļ���
(defun Aisp-Get-GUID (/ objSLTL str)
  (setq objSLTL (vlax-create-object "Scriptlet.TypeLib"))
  (setq str (vlax-get objSLTL 'GUID))
  (vlax-release-object objSLTL)
  str
)

;;;��������: Aisp-Find-File
;;;����: parent_file_path (���ļ�·��) pattern (ģʽ�ַ�)
;;;����ֵ: file_path_table (�ļ�·����)
;;;����ָ���ļ���Ŀ¼��,�����������ļ������������ļ�Ŀ¼�·����������ļ���·��,�ݹ����
(defun Aisp-Find-File (parent_file_path pattern
		       / file_name_ls file_path_table folder_ls)
  (setq file_name_ls (VL-REMOVE-IF-NOT '(LAMBDA (x) (wcmatch x pattern)) (VL-DIRECTORY-FILES parent_file_path nil 1)))
  ;;;�г���ǰĿ¼��,����tfw tif�ļ�
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
  ;;;�г���ǰĿ¼��,�����ļ���,ȥ�� <.> �ļ� <..> �ļ�
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




;;;��������: Aisp-Judge-PolylineDirection 
;;;����: Vla_name
;;;����ֵ: Result (0. �������ʹ��� 1. ˳ʱ�� 2. ��ʱ��)
;;;�ж϶���߻�ͼ����,˳ʱ��,��ʱ��
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
	     ) ;_ ����vlax-curve-getdistatparam
	     (vlax-curve-getdistatparam
	       offsetplineObj
	       (vlax-curve-getEndParam offsetplineObj)
	     ) ;_ ����vlax-curve-getdistatparam
	  )
	(setq Resuls 1)		;;;˳ʱ��
	(setq Resuls 2)		;;;��ʱ��
      )
      (vla-delete offsetplineObj)
    )
    (progn
      (setq Resuls 0)		;;;�������ʹ���
    )
  )
  Resuls
)

;;;��������: Aisp-Make-DistanceLabel
;;;����: Vla-Object (POLYLINE_vla����) Text_Height (���ָ߶�) Text_gap (���ֵ��߾���)  Text_mode (��ע�ڲ�1���ⲿ 2)
;;;����ֵ: successful 
;;;��ע����ξ���,�պ϶����, ��������: Aisp-Judge-PolylineDirection
(defun Aisp-Make-DistanceLabel
       (Vla-Object Text_Height Text_gap Text_mode / successful)
  (if (and
	(= "AcDbPolyline"
	   (vlax-get-property Vla-Object 'ObjectName)
	)
;;;�жϲ����Ϸ���
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
;;;��ȡģ�Ϳռ�
      (setq coord_ls (Aisp-Get-AcDbPolyline-Coordinate Vla-Object))
;;;��ȡ��������


      (setq direction (Aisp-Judge-PolylineDirection Vla-Object))
;;;�ж϶���߻�ͼ˳��
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
      )		;;;�ڲ��ⲿ��ע�ж�
      
      (setq conuter 0)
      (foreach coord coord_ls
	(setq conuter (1+ conuter))
	(setq n_coord (nth conuter coord_ls))
;;;��ñ���һ��Ԫ��
	(if (not n_coord)
	  (setq n_coord (nth 0 coord_ls))
	)
;;;�պ϶���һ��
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
;;;�߶ξ���
	    (setq ang (angle coord n_coord))
;;;�߶νǶ�
	    (setq text_label (rtos dist 2 2))
;;;��ע����
	    (setq text_coor (polar (polar coord ang (* 0.5 dist))
				   (+ ang (* 0.5 pi))
				   Text_gap
			    )
	    )
;;;���ֶ����
	  )
	  (progn
	    (setq dist (distance coord n_coord))
;;;�߶ξ���
	    (setq ang (angle coord n_coord))
;;;�߶νǶ�
	    (setq text_label (rtos dist 2 2))
;;;��ע����
	    (setq text_coor (polar (polar coord ang (* 0.5 dist))
				   (- ang (* 0.5 pi))
				   (+ Text_gap Text_Height)
			    )
	    )
;;;���ֶ����
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
;;;��������
	(vlax-put-property vla-text 'Alignment 1)	;;;�������ֶ��뷽ʽ
	(vlax-put-property vla-text 'Rotation ang)	;;;�������ֽǶ�
	(vlax-put-property
	  vla-text
	  'TextAlignmentPoint
	  (vlax-3d-point text_coor)
	)	;;;�������ֶ����
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
;;		���һ�����Ƿ�����ÿ����ն���μ��ϵ�����
;; | Argument : 'pt'    - point ot be tested 
;; |            'PolyLst' - A nested list of list of points forming the polgon
;; | Return   : T if 'pt' is outside all the polygons, nil if 'pt' falls inside
;; |            atleast on polygon.
;; | Comments : If 'pt' falls exactly on the edge of the bounding polygon, it is
;; |            considered to lie INSIDE the polygon. In other words, the points
;; |            must be completely OUTSIDE the polygons to be considered so.
;;		���'pt'ǡ�����ڱ߽����εı�Ե�ϣ�������
;;		����Ϊλ�ڶ�����ڲ���|�����仰˵��������Щ��
;;		������ȫ�ڶ����֮������������ǡ�
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
;;	����:���һ�����Ƿ���һ����յĶ������
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



;;;��������: Aisp-Judge-Label
;;;����: polygon_coord_ls ����������
;;;����ֵ; result_ls �ɹ����� �ߵ���� ʧ�ܷ��� nil
;;;�ж϶������Ҫ��עǽ��ı�,�жϾ����Ժܴ�
;;;��������: Aisp-Get-AcDbPolyline-Coordinate
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
;;;���� ang_ls Ϊ nil
      (setq temp 0)
;;;��ʱ����Ϊ0
      (foreach polygon_coord polygon_coord_ls
	(setq temp (1+ temp))
	(if (not (setq n_item (nth temp polygon_coord_ls)))
;;;������һ����
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
;;;ѭ����ö����ÿ�������,����ֵ,���� (list ��� ���� ����)
      (setq ang_ls (reverse ang_ls))
;;;�����б�
      (setq
	ang_ls (vl-sort ang_ls '(lambda (a b) (< (cadr a) (cadr b))))
      )
;;;������ֵ�����б�
      (setq temp_ang_ls nil)
      (setq temp 0)
      ;;���ü���Ϊ0
      (setq new_ang_ls nil)
;;;���෽�����±�
      (foreach ang ang_ls
	(setq temp (1+ temp))
	(setq temp_ang_ls (cons ang temp_ang_ls))
;;;ÿ�ν��������ʱ��
	(if (setq n_item (nth temp ang_ls))
;;;��һ���Ƿ�Ϊ��
	  (progn
	    (if	(> (abs (- (cadr ang) (cadr n_item))) 0.25)
;;;ǰ�󻡶�ֵ��� 0.15 ���Ϊ��һ��
	      (progn
		(setq new_ang_ls (cons temp_ang_ls new_ang_ls))
		(setq temp_ang_ls nil)
	      )
	    )
	  )
	  (progn
	    (setq new_ang_ls (cons temp_ang_ls new_ang_ls))
;;;�ﵽ��β,ͬ���� temp_ang_ls �����±�
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


;;;��������: Aisp-Get-Region-Centroid
;;;����: Vla_Object vla����
;;;����ֵ: Centroid �ɹ�����:��������  ʧ�ܷ���nil
;;;��ö�������
(defun Aisp-Get-Region-Centroid(Vla_Object / MSpace object_table re_object_table Centroid)
  (if (= "AcDbPolyline" (vlax-get-property Vla_Object 'ObjectName))
    (progn
      (setq MSpace (vla-get-ModelSpace
		     (vla-get-ActiveDocument (vlax-get-acad-object))
		   )
      )
;;;���ģ�Ϳռ�

      (setq object_table (vlax-make-safearray vlax-vbObject '(0 . 0)))
;;;������������
      (vlax-safearray-fill object_table (list Vla_Object))
;;;����������

      (setq re_object_table
	     (vlax-invoke-method
	       MSpace
	       'AddRegion
	       object_table
	     )
      )
;;;��������,��������������
      (setq re_object_table
	     (vlax-safearray->list
	       (vlax-variant-value re_object_table)
	     )
      )
;;;ת��Ϊlist

      (setq
	Centroid (vlax-get-property (nth 0 re_object_table) 'Centroid)
      )
;;;�����������
      (setq
	Centroid (vlax-safearray->list (vlax-variant-value Centroid))
      )
;;;ת��Ϊlist

      (vlax-invoke-method (nth 0 re_object_table) 'Delete)
;;;ɾ���������

      (vlax-release-object MSpace)
;;;�ͷſռ�
      (gc)
    )
    (progn
      (setq Centroid nil)
    )
  )
  Centroid
)

;;;��������: XD::String:RegExpS
;;;����:    pat = ������ʽģʽ ,��Ӧvbs������ʽ��ģʽ(expression)��˵��: \\��Ҫ��\\\\���.
;;; 	    str = �ַ���
;;; 	    key = \"i\" \"g\" \"m\" , \"i\"�����ִ�Сд��Ignorecase��,\"g\"ȫ��ƥ�䣨Global��.
;;;           \"m\"����ģʽ��Multiline�������ϼ����ؼ��ֿ������ʹ�ã����� \"\".
;;;����ֵ:  ����ƥ����ַ��б�����һƥ�䷵��nil
;;����: ���ַ�������������ʽƥ�����. 
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

;;;��������: Aisp-get-Chinese
;;;����:    str (��Ҫ�ָ���ַ���)
;;;����ֵ:  ������ȡ���������ַ�
;;����: ���ַ�������������ʽƥ�����.��ȡ���е������ַ�
(defun Aisp-get-Chinese (str / resultStr strList)
  (setq delim "[\\u4E00-\\u9FA5]+")
  (setq strList (xd::string:regexps delim str ""))
  (setq resultStr "")
  (foreach str strList
    (setq resultStr (strcat resultStr str))
  )
  resultStr
)



