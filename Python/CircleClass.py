class Circle_Class(object):
    global pi
    pi = 3.1415926535897931 # Class-wide private constant
    @staticmethod
    def print_circle(circle):
	    print 'Circle: r = ', circle.radius
	    print 'Circle: area = ', circle.area()
    class Circle(object):
	def __init__(self, radius):
	    self.radius = radius
	def area(self):
	    return pi * self.radius**2
        

# Main program starts here
if __name__ == '__main__':
    circle = Circle_Class.Circle(1.5)
    Circle_Class.print_circle(circle)
    
