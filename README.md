(work in progress)

beta testing:

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
		textShadowColor: [255, 100, 50]

		textShadowBlur: 10

		rotateX: 10
		rotateY: 20
		rotateZ: 40

		x: 20
		y: 30
		z: 40

		localX: 100
		localY: 102
		localZ: 103

		scaleX: 1.1
		scaleY: 1.1
		scaleZ: 1.1

		skewX: 20
		skewY: 30

		perspective: 400

	dumElement1 = new DUM(element, initOptions)
	.x(400)
	.y(200)

	console.log dumElement1.getX()


	dumElement2 = DUM('.hello', initOptions)
	.inside(document.body)
	.html('Foxie')
	.set('salam', 'farsi')

	console.log dumElement2.get('salam')
	console.log dumElement2.current('width')

