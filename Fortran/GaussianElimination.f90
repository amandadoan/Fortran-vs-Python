program ge
!!---------------------------------------------------------------------------
    implicit none

    ! Matrix of coefficients; the one is filled by random_number()
    real, dimension(:, :), allocatable :: A

    ! "Analytical" solution; the one is filled by random_number()
    real, dimension(:), allocatable :: u

    ! Right-hand side (RHS); the one is calculated as f = A * u
    ! Numerical solution (NS) of the equation A y = f
    ! RHS is overwritten by NS
    real, dimension(:), allocatable :: y

    ! Size of matrix
    integer, parameter :: n = 4

    ! Allocate memory
    allocate(A(n, n))
    allocate(u(n))
    allocate(y(n))

    ! Algorithm uses Fortran 90 features
    call Generate_Data()
    call Elimination()
    call Backsubstition()
    
    ! Print results
    print *, y

    ! Free memory
    deallocate(A)
    deallocate(u)
    deallocate(y)
!!---------------------------------------------------------------------------
contains
!!---------------------------------------------------------------------------
subroutine Generate_Data()
    A = reshape((/ 1, 1, 1, 1, 1, -2, -2, -2, 1, 4, -4, 1, 1, -5,  -5, -3 /), (/ n, n/))
    u = (/ 0, 4, 2, -4 /)
    y = matmul(A, u)
end subroutine Generate_Data

subroutine Elimination()
    integer :: k

    do k = 1, n-1
        a(k+1: n, k) = a(k+1: n, k) / a(k, k)

        a(k+1: n, k+1: n) = a(k+1: n, k+1: n) - &
                matmul(a(k+1: n, k: k), a(k: k, k+1: n))
    end do

end subroutine Elimination

subroutine Backsubstition()
    integer :: i

    ! L x = f  =>  x = L \ f
    do i = 1, n
        y(i) = y(i) - dot_product(a(i, 1: i-1), y(1: i-1))
    end do

    ! U y = x  =>  y = U \ x
    do i = n, 1, -1
        y(i) = y(i) - dot_product(a(i, i+1: n), y(i+1: n))
        y(i) = y(i) / a(i, i)
    end do

end subroutine Backsubstition

end program ge
