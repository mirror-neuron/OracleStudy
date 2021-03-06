=====================================================
--■■■ 학생 정보 출력 뷰 ■■■--
=======================================================
CREATE OR REPLACE VIEW VIEW_AD_ALL_INFO
AS
SELECT CO.NAME"과정명", CL.NAME"강의실", SU.NAME"과목명", OS.START_DATE"과목시작일", OS.END_DATE"과목종료일", BO.NAME"교재명", PR.NAME"교수자명"
FROM TBL_COURSES CO, TBL_CLASSROOM CL, TBL_SUBJECTS SU, TBL_OP_SUBJECTS OS, TBL_BOOKS BO, TBL_PROFESSORS PR, TBL_OP_COURSES OC
WHERE CO.COURSE_CODE = OC.COURSE_CODE AND CL.CLR_CODE = OC.CLR_CODE AND SU.SUBJECT_CODE = OS.SUBJECT_CODE 
  AND BO.BOOK_CODE = OS.BOOK_CODE AND PR.PRO_CODE = OS.PRO_CODE;
