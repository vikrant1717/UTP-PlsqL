PROMPT Does not invoke setup procedure when beforeeach procedure name for a test is null

--Arrange
declare
  simple_test ut_test := ut_test(
    a_object_name => 'ut_example_tests'
    ,a_name => 'ut_passing_test'
  );
begin
  simple_test.before_each_list := ut_executables(ut_executable(user, 'ut_example_tests', '', ut_utils.gc_before_each));
  ut_example_tests.g_number2 := null;
--Act
  simple_test.do_execute();
--Assert
  if ut_example_tests.g_number2 is null then
    :test_result := ut_utils.gc_success;
  else
    dbms_output.put_line('expected: ut_example_tests.g_number is null, got: '||ut_example_tests.g_number2 );
  end if;
end;
/
