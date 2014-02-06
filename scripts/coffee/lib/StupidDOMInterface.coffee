css = require './css'

module.exports = class StupidDOMInterface

	constructor: (@node, initial) ->

		@_s = new Float32Array 25

		@_style = @node.style

		@_initialize initial

	_initialize: (initial) ->

		# initialize opacity
		@_s[6] = 1

		# initialize transform values
		@_s[19] = 1
		@_s[20] = 1
		@_s[21] = 1
		@_s[24] = 1000000

		return if initial is undefined or initial is null

		@set(initial)

	set: (props) ->

		for name, val of props

			if Array.isArray val

				@[name].apply @, val

			else

				@[name] val

		@

	_setTextShadow: ->

		@_style.textShadow = (@_s[7] + 'px') + ' ' + (@_s[8] + 'px') + ' ' + (@_s[9] + 'px') + ' ' + ('rgb(' + @_s[10] + ',' + @_s[11] + ',' + @_s[12] + ')')

	_setTransform: ->

		transformString = ''

		if @_s[13] isnt 0

			transformString = ' rotateX(' + @_s[13] + 'deg) ' + transformString

		if @_s[14] isnt 0

			transformString = ' rotateY(' + @_s[14] + 'deg) ' + transformString

		if @_s[15] isnt 0

			transformString = ' rotateZ(' + @_s[15] + 'deg) ' + transformString

		if @_s[16] isnt 0

			transformString = ' translateX(' + @_s[16] + 'px) ' + transformString

		if @_s[17] isnt 0

			transformString = ' translateY(' + @_s[17] + 'px) ' + transformString

		if @_s[18] isnt 0

			transformString = ' translateZ(' + @_s[18] + 'px) ' + transformString

		if @_s[19] isnt 1

			transformString = ' scaleX(' + @_s[19] + ') ' + transformString

		if @_s[20] isnt 1

			transformString = ' scaleY(' + @_s[20] + ') ' + transformString

		if @_s[21] isnt 1

			transformString = ' scaleZ(' + @_s[21] + ') ' + transformString

		if @_s[22] isnt 0

			transformString = ' skewX(' + @_s[22] + 'deg) ' + transformString

		if @_s[23] isnt 0

			transformString = ' skewY(' + @_s[23] + 'deg) ' + transformString

		if @_s[24] < 1000000

			transformString = ' perspective(' + @_s[24] + ') ' + transformString


		css.setTransform @node, transformString

	#
	#	Size
	#

	getWidth: ->

		@_s[0]

	width: (width) ->

		@_style.width = width + 'px'

		@_s[0] = width

		return @

	getHeight: ->

		@_s[1]

	height: (height) ->

		@_style.height = height + 'px'

		@_s[1] = height

		return @

	#
	#	Pos
	#

	getTop: ->

		@_s[2]

	top: (top) ->

		@_style.top = top + 'px'

		@_s[2] = top

		return @

	getLeft: ->

		@_s[3]

	left: (left) ->

		@_style.left = left + 'px'

		@_s[3] = left

		return @

	getBottom: ->

		@_s[4]

	bottom: (bottom) ->

		@_style.bottom = bottom + 'px'

		@_s[4] = bottom

		return @

	getRight: ->

		@_s[5]

	right: (right) ->

		@_style.right = right + 'px'

		@_s[5] = right

		return @

	#
	#	Opacity
	#

	getOpacity: ->

		@_s[6]

	opacity: (opacity) ->

		@_style.opacity = opacity

		@_s[6] = opacity

		return @

	#
	#	Text Shadow
	#

	getTextShadowH: ->

		@_s[7]

	textShadowH: (h) ->

		@_s[7] = h

		do @_setTextShadow

		return @

	getTextShadowV: ->

		@_s[8]

	textShadowV: (v) ->

		@_s[8] = v

		do @_setTextShadow

		return @

	getTextShadowBlur: ->

		@_s[9]

	textShadowBlur: (blur) ->

		@_s[9] = blur

		do @_setTextShadow

		return @

	getTextShadowColor: ->

		[@_s[10], @_s[11], @_s[12]]

	textShadowColor: (colorRed, colorGreen, colorBlue) ->

		@_s[10] = colorRed
		@_s[11] = colorGreen
		@_s[12] = colorBlue

		do @_setTextShadow

		return @

	#
	#	Transforms
	#
	#	Rotate
	#

	getRotateX: ->

		@_s[13]

	rotateX: (rotateX) ->

		@_s[13] = rotateX

		do @_setTransform

		return @

	getRotateY: ->

		@_s[14]

	rotateY: (rotateY) ->

		@_s[14] = rotateY

		do @_setTransform

		return @

	getRotateZ: ->

		@_s[15]

	rotateZ: (rotateZ) ->

		@_s[15] = rotateZ

		do @_setTransform

		return @

	#
	#	Translate
	#

	getTranslateX: ->

		@_s[16]

	translateX: (translateX) ->

		@_s[16] = translateX

		do @_setTransform

		return @

	getTranslateY: ->

		@_s[17]

	translateY: (translateY) ->

		@_s[17] = translateY

		do @_setTransform

		return @

	getTranslateZ: ->

		@_s[18]

	translateZ: (translateZ) ->

		@_s[18] = translateZ

		do @_setTransform

		return @

	#
	#	Scale
	#

	getScaleX: ->

		@_s[19]

	scaleX: (scaleX) ->

		@_s[19] = scaleX

		do @_setTransform

		return @

	getScaleY: ->

		@_s[20]

	scaleY: (scaleY) ->

		@_s[20] = scaleY

		do @_setTransform

		return @

	getScaleZ: ->

		@_s[21]

	scaleZ: (scaleZ) ->

		@_s[21] = scaleZ

		do @_setTransform

		return @

	#
	#	Skew
	#

	getSkewX: ->

		@_s[22]

	skewX: (skewX) ->

		@_s[22] = skewX

		do @_setTransform

		return @

	getSkewY: ->

		@_s[23]

	skewY: (skewY) ->

		@_s[23] = skewY

		do @_setTransform

		return @

	#
	#	perspective
	#

	getPerspective: ->

		@_s[24]

	perspective: (perspective) ->

		@_s[24] = perspective

		do @_setTransform

		return @

