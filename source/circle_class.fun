test_suite circle_class

! Global variables can be declared here
real, parameter :: radius = 1.5d0
real, parameter :: pi = 3.14159d0
type(circle) :: c

setup
  ! Place code here that should run before each test
  c = circle(radius)
end setup

teardown
  ! This code runs immediately after each test
end teardown

! Example test using all six assertions
test funit_assertions
  integer, dimension(2) :: a = (/ 1, 2 /)
  integer, dimension(2) :: b = (/ 1, 2 /)

  assert_array_equal(a,b)
  assert_real_equal(0.9999999e0, 1.0e0)
  assert_equal_within(1e-7, 0.0, 1e-6)
  assert_equal(1, 5 - 4)
  assert_false(5 < 4)
  assert_true(4 == 4)
end test

test radius_is_stored_properly
  assert_real_equal(radius, 1.5d0)
end test

test area_varies_with_radius
  real :: area
  area = circle_area(c)
  assert_equal_within(area, pi*(radius**2), 1e-3)
end test

end test_suite
