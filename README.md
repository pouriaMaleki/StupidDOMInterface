(work in progress)

installation:

	npm install stupid-dom-interface

beta testing:

	DUM = require 'StupidDOMInterface'

	element = document.querySelector('.element')

	# optional init

	props =

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

	dumElement1 = new DUM(element, props)
	.x(400)
	.y(200)

	console.log dumElement1.getX()


	dumElement2 = DUM('.hello', props)
	.inside(document.body)
	.html('custom html')
	.set('someVar', 'some value')

	console.log dumElement2.get('someVar')
	console.log dumElement2.current('width')


	dumInput3 = DUM('input[type=text, placeholder=x, value=20].cssclass1.classClass2')
	.inside(dumElement2)

	dumInput3.node.addEventListener('change', callbackFunction)
