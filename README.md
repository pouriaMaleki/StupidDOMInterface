(work in progress)

beta testing:

	```

	DUM = require 'StupidDOMInterface'

	element = document.querySelector('.element')

	# optional init

	initOptions =

		height: 200
		width: 300

		opacity: .8

		top: 100
		left: 120
		bottom: 200
		right: 400

		textShadowH: 5
		textShadowV: 10
		textShadowColor:

			red: 255
			green: 100
			blue: 50

		textShadowBlur: 10

		rotateX: 10
		rotateY: 20
		rotateZ: 40

		translateX: 100
		translateY: 102
		translateZ: 103

		scaleX: 1.1
		scaleY: 1.1
		scaleZ: 1.1

		skewX: 20
		skewY: 30

		perspective: 400

	dumElement = new DUM element, initOptions

	```