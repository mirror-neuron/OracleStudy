=====================================================
--���� �л� ���� ��� �� ����--
=======================================================
CREATE OR REPLACE VIEW VIEW_AD_ALL_INFO
AS
SELECT CO.NAME"������", CL.NAME"���ǽ�", SU.NAME"�����", OS.START_DATE"���������", OS.END_DATE"����������", BO.NAME"�����", PR.NAME"�����ڸ�"
FROM TBL_COURSES CO, TBL_CLASSROOM CL, TBL_SUBJECTS SU, TBL_OP_SUBJECTS OS, TBL_BOOKS BO, TBL_PROFESSORS PR, TBL_OP_COURSES OC
WHERE CO.COURSE_CODE = OC.COURSE_CODE AND CL.CLR_CODE = OC.CLR_CODE AND SU.SUBJECT_CODE = OS.SUBJECT_CODE 
  AND BO.BOOK_CODE = OS.BOOK_CODE AND PR.PRO_CODE = OS.PRO_CODE;
