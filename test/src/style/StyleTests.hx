/*
This file is part of Silex - see http://projects.silexlabs.org/?/silex

Silex is © 2010-2011 Silex Labs and is released under the GPL License:

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/

package style;

/**
 * Units tests for Styles
 * @author Yannick DOMINGUEZ
 * 
 * 
 */

import cocktail.style.Style;
import haxe.Log;
import cocktail.domElement.ContainerDOMElement;
import cocktail.geom.GeomData;
import cocktail.domElement.DOMElement;
import cocktail.domElement.abstract.AbstractDOMElement;
import cocktail.style.StyleData;
import cocktail.domElement.GraphicDOMElement;
import cocktail.domElement.DOMElementData;
import cocktail.unit.UnitData;
import utest.Assert;
import utest.Runner;
import utest.ui.Report;

import cocktail.resource.ResourceLoaderManager;
import cocktail.nativeElement.NativeElementData;
import cocktail.nativeElement.NativeElementManager;


class StyleTests 
{
	
	private static var rootDOMElement:DOMElement;
	
	private var _mainContainer:ContainerDOMElement;
	
	private var _background:GraphicDOMElement;
	
	private var _siteBackground:GraphicDOMElement;
	
	private var _navigation:GraphicDOMElement;
	
	private var _header:GraphicDOMElement;
	
	private var _siteRightBackground:GraphicDOMElement;
	
	private var _footer:GraphicDOMElement;
	
	private var _siteLeftFloatBackground:GraphicDOMElement;
	
	private var _siteLeftAfterFloatBackground:GraphicDOMElement;
	private var _siteLeftAfterFloatBackground2:GraphicDOMElement;
	private var _siteLeftAfterFloatBackground3:GraphicDOMElement;
	
	private var _insetGraphicElement:GraphicDOMElement;
	
	public static function main()
	{
		//rootDOMElement = new ContainerDOMElement(NativeElementManager.getRoot());
		new StyleTests();
	}
	
	public function new() 
	{
		#if js
		js.Lib.window.onresize = refresh;
		
		#elseif flash9
		flash.Lib.current.stage.addEventListener(flash.events.Event.RESIZE, refresh);
		
		#end
		testLayout2();
		
		
		
	}
	
	public function testLayout2()
	{
		_background = getGraph();
		_background.style.width = DimensionStyleValue.percent(90);
		_background.style.height = DimensionStyleValue.percent(100);
		_background.style.position = absolute;

		
		
		_mainContainer = getContainer();
		_mainContainer.style.width = DimensionStyleValue.percent(80);
		_mainContainer.style.height = DimensionStyleValue.auto;
		_mainContainer.style.left = PositionOffsetStyleValue.length(px(20));
		_mainContainer.style.right = PositionOffsetStyleValue.length(px(20));
		//_mainContainer.style.top = PositionOffsetStyleValue.length(px(500));
		_mainContainer.style.bottom = PositionOffsetStyleValue.length(px(20));
		_mainContainer.style.position = PositionStyleValue.relative;
		
		attach(_mainContainer);
		
		_siteBackground = getGraph();
		_siteBackground.style.width = DimensionStyleValue.percent(90);
		_siteBackground.style.height = DimensionStyleValue.percent(100);
		_siteBackground.style.position = absolute;
		
		var siteContainer:ContainerDOMElement = getContainer();
		siteContainer.style.position = absolute;
		//siteContainer.style.width = DimensionStyleValue.percent(70);
	//	siteContainer.style.height = DimensionStyleValue.auto;
	//	siteContainer.style.marginLeft = MarginStyleValue.auto;
	//	siteContainer.style.marginRight = MarginStyleValue.auto;
	//	siteContainer.style.marginTop = MarginStyleValue.length(pixel(10));
		siteContainer.style.left = PositionOffsetStyleValue.length(px(40));
		siteContainer.style.right = PositionOffsetStyleValue.length(px(40));
		siteContainer.style.top = PositionOffsetStyleValue.length(px(40));
		siteContainer.style.bottom = PositionOffsetStyleValue.length(px(40));
		
		//siteContainer.addChild(_siteBackground);
		//_mainContainer.addChild(siteContainer);
		
		
		var headerContainer:ContainerDOMElement = getContainer();
		headerContainer.style.width = DimensionStyleValue.auto;
		headerContainer.style.height = DimensionStyleValue.length(px(150));
		headerContainer.style.paddingTop = PaddingStyleValue.length(px(5));
		headerContainer.style.paddingBottom = PaddingStyleValue.length(px(5));
		headerContainer.style.paddingLeft = PaddingStyleValue.length(px(5));
		headerContainer.style.paddingRight = PaddingStyleValue.length(px(5));
		headerContainer.style.marginBottom = MarginStyleValue.length(px(10));
		
		_header = getGraph();
		_header.style.width = DimensionStyleValue.auto;
		_header.style.height = DimensionStyleValue.length(px(300));
		_header.style.float = FloatStyleValue.right;
		//_header.style.display = DisplayStyleValue._inline;
		
		
		headerContainer.addChild(_header);
		
		siteContainer.addChild(headerContainer);
		//_mainContainer.addText(NativeElementManager.createNativeTextNode("oihiojhiopnj"));
		var siteLeftContainer:ContainerDOMElement = getContainer();
		siteLeftContainer.style.width = DimensionStyleValue.percent(70);
		siteLeftContainer.style.height = DimensionStyleValue.auto;
		//siteLeftContainer.style.display = inlineBlock;

		
		_navigation = getGraph();
		_navigation.style.width = DimensionStyleValue.auto;
		_navigation.style.height = DimensionStyleValue.length(px(50));
		_navigation.style.paddingLeft = PaddingStyleValue.length(px(10));
		_navigation.style.paddingRight = PaddingStyleValue.length(px(10));
		_navigation.style.float = FloatStyleValue.left;
		//_navigation.style.marginLeft = MarginStyleValue.auto;
		//_navigation.style.marginRight = MarginStyleValue.auto;
		
		var siteLeftTextContainer:ContainerDOMElement = getContainer();
		//siteLeftTextContainer.style.width = DimensionStyleValue.auto;
		//siteLeftTextContainer.style.height = DimensionStyleValue.auto;
		siteLeftTextContainer.style.paddingLeft = PaddingStyleValue.length(px(10));
		siteLeftTextContainer.style.paddingRight = PaddingStyleValue.length(px(10));
		//siteLeftTextContainer.style.display = DisplayStyleValue.inlineBlock;
		/**
		var siteLeftText:TextDOMElement = getText();
	//	siteLeftText.style.width = DimensionStyleValue.length(px(300));
		//siteLeftText.style.marginTop = MarginStyleValue.length(px(10));
	//	siteLeftText.style.height = DimensionStyleValue.length(px(300));
		siteLeftText.style.display = DisplayStyleValue._inline;
		
		//siteLeftText.style.marginLeft = MarginStyleValue.auto;
		//siteLeftText.style.marginRight = MarginStyleValue.auto;
		//siteLeftText.style.display = DisplayStyleValue.inlineBlock;
		
		var siteLeftText2:TextDOMElement = getText();
		//siteLeftText2.nativeElement = NativeElementManager.createNativeElement(custom("span"));
		//siteLeftText2.style.width = DimensionStyleValue.length(px(300));
		//siteLeftText2.style.marginTop = MarginStyleValue.length(px(10));
		//siteLeftText2.style.height = DimensionStyleValue.length(px(300));
		//siteLeftText2.style.marginLeft = MarginStyleValue.auto;
		//siteLeftText2.style.marginRight = MarginStyleValue.auto;
		siteLeftText2.style.display = DisplayStyleValue._inline;
		
		var siteLeftText3:TextDOMElement = getText();
		//siteLeftText3.style.width = DimensionStyleValue.length(px(300));
		//siteLeftText3.style.marginTop = MarginStyleValue.length(px(10));
		//siteLeftText3.style.height = DimensionStyleValue.length(px(300));
		//siteLeftText2.style.marginLeft = MarginStyleValue.auto;
		//siteLeftText2.style.marginRight = MarginStyleValue.auto;
		siteLeftText3.style.display = DisplayStyleValue._inline;
		*/
		
		siteLeftTextContainer.style.fontSize = FontSizeStyleValue.length(px(20));
		siteLeftTextContainer.style.lineHeight = LineHeightStyleValue.length(px(25));
		
		/**
		//siteLeftTextContainer.addChild(siteLeftText);
		siteLeftText.appendText(NativeElementManager.createNativeTextNode("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu facilisis mi. Curabitur convallis tortor sit amet mi euismod convallis convallis justo placerat. Suspendisse rutrum justo et nunc dapibus semper. Donec id lectus nec lorem consectetur elementum ac eget odio. Curabitur ac ligula sem. Donec diam nisl, cursus eu luctus in, porttitor a tellus. Nullam auctor erat eget mi tristique porttitor. Quisque dignissim mattis purus id hendrerit. Cras turpis enim, ultricies viverra scelerisque eu, pharetra eget nibh. Suspendisse potenti"));
		siteLeftText2.style.fontSize = FontSizeStyleValue.length(px(60));
		siteLeftText2.style.lineHeight = LineHeightStyleValue.length(px(60));
		siteLeftText.appendTextDOMElement(siteLeftText2);
		siteLeftText2.appendText(NativeElementManager.createNativeTextNode("Lorem ipsum"));
		siteLeftText.appendTextDOMElement(siteLeftText3);
		siteLeftText3.style.fontSize = FontSizeStyleValue.length(px(25));
		siteLeftText3.style.lineHeight = LineHeightStyleValue.length(px(25));
		siteLeftText3.appendText(NativeElementManager.createNativeTextNode("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu facilisis mi. Curabitur convallis tortor sit amet mi euismod conva"));
		*/
		//_mainContainer.addChild(siteLeftTextContainer);
		
		//_mainContainer.style.whiteSpace = WhiteSpaceStyleValue.pre;
		//_mainContainer.style.textAlign = TextAlignStyleValue.right;
		//siteLeftTextContainer.addChild(siteLeftText2);
		//siteLeftTextContainer.addChild(siteLeftText3);
		var siteLeftContainerChildren:ContainerDOMElement = getContainer();
		siteLeftContainerChildren.style.display = DisplayStyleValue._inline;
		siteLeftContainerChildren.addText(NativeElementManager.createNativeTextNode(" BOUM "));
		siteLeftContainerChildren.style.fontSize = FontSizeStyleValue.length(px(90));
		siteLeftContainerChildren.style.fontWeight = FontWeightStyleValue.bold;
		//siteLeftContainerChildren.style.fontVariant = FontVariantStyleValue.smallCaps;
		siteLeftContainerChildren.style.verticalAlign = VerticalAlignStyleValue.sub;
		siteLeftContainerChildren.style.letterSpacing = LetterSpacingStyleValue.length(px(20));
		siteLeftContainerChildren.style.color = ColorValue.keyword(ColorKeywordValue.red);
		siteLeftContainerChildren.style.fontFamily = [FontFamilyStyleValue.genericFamily(GenericFontFamilyValue.serif)];
		
		var siteLeftContainerChildren2:ContainerDOMElement = getContainer();
		siteLeftContainerChildren2.style.display = DisplayStyleValue._inline;
		siteLeftContainerChildren2.addText(NativeElementManager.createNativeTextNode(" BADA"));
		siteLeftContainerChildren2.style.fontSize = FontSizeStyleValue.length(px(50));
		siteLeftContainerChildren2.style.fontStyle = FontStyleStyleValue.italic;
		siteLeftContainerChildren.addChild(siteLeftContainerChildren2);
		siteLeftContainerChildren2.style.textTransform = TextTransformStyleValue.capitalize;
	
		
		//_mainContainer.style.lineHeight = LineHeightStyleValue.length(px(40));
		//_mainContainer.style.wordSpacing  = WordSpacingStyleValue.length(px(20));
		//_mainContainer.style.letterSpacing = LetterSpacingStyleValue.length(px(30));
		
		var textContainer:ContainerDOMElement = getContainer();
		//textContainer.addText(NativeElementManager.createNativeTextNode(" consectetur adipiscing."));
		//textContainer.addText(NativeElementManager.createNativeTextNode("Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, consectetur, Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur, Lorem ipsum dolor sit amet, consectetur, Lorem ipsum dolor sit amet, consectetur, Lorem ipsum dolor sit amet, consectetur, Lorem ipsum dolor sit amet, consectetur, Lorem ipsum dolor sit amet, consectetur, "));
		//textContainer.style.textIndent =  TextIndentStyleValue.length(px(150));
		//siteContainer.addChild(textContainer);
		textContainer.style.width = DimensionStyleValue.percent(50);
		
		
		
		_insetGraphicElement = getGraph();
		_insetGraphicElement.style.width = DimensionStyleValue.length(px(200));
		_insetGraphicElement.style.height = DimensionStyleValue.length(px(120));
		_insetGraphicElement.style.display = DisplayStyleValue._inline;
		
		
		
		
		//textContainer.addChild(_insetGraphicElement);
		textContainer.addText(NativeElementManager.createNativeTextNode("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus facilisis tortor sodales lacus pretium scelerisque dapibus est rhoncus. Aenean feugiat nulla vel libero imperdiet et iaculis nisl tristique. Pellentesque congue varius consectetur. Sed vulputate tristique ante, at ullamcorper odio adipiscing vitae. Cras interdum blandit ultricies. Pellentesque id lacus orci. Sed volutpat mi vel odio viverra molestie. Fusce rutrum purus accumsan lectus venenatis mattis at vel eros. Sed ac scelerisque neque. Donec et mi mollis ligula imperdiet euismod. Nunc ac consectetur orci. Morbi a enim lacus. Pellentesque dolor massa, vestibulum vitae placerat pretium, gravida suscipit nulla. Pellentesque est ipsum, egestas ut ullamcorper bibendum, dapibus at erat. Morbi purus lectus, aliquam at molestie in, sagittis ac magna. "));
		//textContainer.addChild(siteLeftContainerChildren);
		textContainer.addText(NativeElementManager.createNativeTextNode("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus facilisis tortor sodales lacus pretium scelerisque dapibus est rhoncus. Aenean feugiat nulla vel libero imperdiet et iaculis nisl tristique. Pellentesque congue varius consectetur. Sed vulputate tristique ante, at ullamcorper odio adipiscing vitae. Cras interdum blandit ultricies. Pellentesque id lacus orci. Sed volutpat mi vel odio viverra molestie. Fusce rutrum purus accumsan lectus venenatis mattis at vel eros. Sed ac scelerisque neque. Donec et mi mollis ligula imperdiet euismod. Nunc ac consectetur orci. Morbi a enim lacus. Pellentesque dolor massa, vestibulum vitae placerat pretium, gravida suscipit nulla. Pellentesque est ipsum, egestas ut ullamcorper bibendum, dapibus at erat. Morbi purus lectus, aliquam at molestie in, sagittis ac magna. "));
		//textContainer.style.position = PositionStyleValue.relative;
		//textContainer.style.top = PositionOffsetStyleValue.length(px(300));
		textContainer.style.fontSize = FontSizeStyleValue.length(px(9));
		textContainer.style.display = DisplayStyleValue._inline;
		//textContainer.style.lineHeight = LineHeightStyleValue.length(px(70));
		_siteLeftFloatBackground = getGraph();
		_siteLeftFloatBackground.style.width = DimensionStyleValue.length(px(50));
		_siteLeftFloatBackground.style.height = DimensionStyleValue.length(px(400)); 
		//_siteLeftFloatBackground.style.float = FloatStyleValue.left;
		
		var firstLetterContainer:ContainerDOMElement = getContainer();
		firstLetterContainer.addText(NativeElementManager.createNativeTextNode("a, b, c, d "));
		firstLetterContainer.style.textTransform = TextTransformStyleValue.uppercase;
		firstLetterContainer.style.fontSize = FontSizeStyleValue.length(px(50));
		firstLetterContainer.style.display = DisplayStyleValue._inline;
		firstLetterContainer.style.float = FloatStyleValue.left;
		firstLetterContainer.style.width = DimensionStyleValue.length(px(400));
		firstLetterContainer.style.height = DimensionStyleValue.length(px(50));
		
		var textBlock:ContainerDOMElement = getContainer();
		
		textBlock.addChild(firstLetterContainer);
		textBlock.addChild(textContainer);
		
		var siteLeftFloat:ContainerDOMElement = getContainer();
		siteLeftFloat.style.width = DimensionStyleValue.length(px(50));
		siteLeftFloat.style.float = FloatStyleValue.left;
		//siteLeftFloat.style.clear = ClearStyleValue.both;
		
		var siteLeftFloat2:ContainerDOMElement = getContainer();
		siteLeftFloat2.style.width = DimensionStyleValue.length(px(20));
		siteLeftFloat2.style.height = DimensionStyleValue.length(px(120));
		siteLeftFloat2.style.float = FloatStyleValue.left;
		
		var siteLeftAfterFloatBackgroundContainer:ContainerDOMElement = getContainer();
		siteLeftAfterFloatBackgroundContainer.style.width = DimensionStyleValue.auto;
		siteLeftAfterFloatBackgroundContainer.style.height = DimensionStyleValue.auto;
		
		_siteLeftAfterFloatBackground = getGraph();
		_siteLeftAfterFloatBackground.style.width = DimensionStyleValue.length(px(200));
		_siteLeftAfterFloatBackground.style.height = DimensionStyleValue.length(px(400));
		
		_siteLeftAfterFloatBackground2 = getGraph();
		_siteLeftAfterFloatBackground2.style.width = DimensionStyleValue.length(px(200));
		_siteLeftAfterFloatBackground2.style.height = DimensionStyleValue.length(px(50));
		_siteLeftAfterFloatBackground2.style.marginTop = MarginStyleValue.length(px(10));
		_siteLeftAfterFloatBackground2.style.float = FloatStyleValue.right;
		
		_siteLeftAfterFloatBackground3 = getGraph();
		_siteLeftAfterFloatBackground3.style.width = DimensionStyleValue.percent(40);
		_siteLeftAfterFloatBackground3.style.height = DimensionStyleValue.length(px(50));
		_siteLeftAfterFloatBackground3.style.paddingTop = PaddingStyleValue.length(px(5));
		//_siteLeftAfterFloatBackground3.style.clear = ClearStyleValue.right;
		
		siteLeftAfterFloatBackgroundContainer.addChild(_siteLeftAfterFloatBackground);
		siteLeftAfterFloatBackgroundContainer.addChild(_siteLeftAfterFloatBackground2);
		siteLeftAfterFloatBackgroundContainer.addChild(_siteLeftAfterFloatBackground3);
		
		siteLeftFloat.addChild(_siteLeftFloatBackground);
		
		//siteLeftTextContainer.addChild(siteLeftFloat);
		//siteLeftTextContainer.addChild(siteLeftFloat2);
		
		siteLeftContainer.addChild(_navigation);
		siteLeftContainer.addChild(siteLeftTextContainer);
		siteLeftContainer.addChild(siteLeftFloat);
		siteLeftContainer.addChild(siteLeftAfterFloatBackgroundContainer);
		
		var siteRightLeftContainer:ContainerDOMElement = getContainer();
		siteRightLeftContainer.style.width = DimensionStyleValue.percent(100);
		siteRightLeftContainer.style.height = DimensionStyleValue.auto;
		
		siteRightLeftContainer.addChild(siteLeftContainer);
		
		//_mainContainer.addChild(siteLeftContainer);
		
		var siteContainerRight:ContainerDOMElement = getContainer();
		siteContainerRight.style.width = DimensionStyleValue.percent(30);
		siteContainerRight.style.height = DimensionStyleValue.auto;
		//siteContainerRight.style.display = inlineBlock;
		
		//siteRightLeftContainer.addChild(siteContainerRight);
	
		
		_siteRightBackground = getGraph();
		_siteRightBackground.style.width = DimensionStyleValue.percent(100);
		_siteRightBackground.style.height = DimensionStyleValue.length(px(500));
		
		siteContainerRight.addChild(_siteRightBackground);
		
		 _footer = getGraph();
		_footer.style.width = DimensionStyleValue.percent(50);
		_footer.style.height = DimensionStyleValue.length(px(250));
		_footer.style.marginTop = MarginStyleValue.length(px(10));
		_footer.style.float = FloatStyleValue.right;
		
		_mainContainer.addChild(headerContainer);
		_mainContainer.addChild(textBlock);
		_mainContainer.addChild(_footer);
		
		
		//siteContainer.addChild(_footer);
		
		
		
		refresh();
		
		
		
	
	}
	
	public function testLayout()
	{
		_background = getGraph();
		_background.style.width = DimensionStyleValue.percent(90);
		_background.style.height = DimensionStyleValue.length(px(100));
		_background.style.position = absolute;

		
		
		_mainContainer = getContainer();
		//_mainContainer.style.width = DimensionStyleValue.percent(100);
		
		attach(_mainContainer);
		_siteBackground = getGraph();
		_siteBackground.style.width = DimensionStyleValue.percent(100);
		_siteBackground.style.height = DimensionStyleValue.percent(100);
		_siteBackground.style.position = absolute;
		
		var siteContainer:ContainerDOMElement = getContainer();
		siteContainer.style.position = absolute;
		siteContainer.style.left = PositionOffsetStyleValue.length(px(40));
		siteContainer.style.right = PositionOffsetStyleValue.length(px(40));
		siteContainer.style.top = PositionOffsetStyleValue.length(px(40));
		siteContainer.style.bottom = PositionOffsetStyleValue.length(px(40));
		
		
		var headerContainer:ContainerDOMElement = getContainer();
		headerContainer.style.width = DimensionStyleValue.auto;
		headerContainer.style.height = DimensionStyleValue.auto;
		headerContainer.style.paddingTop = PaddingStyleValue.length(px(5));
		headerContainer.style.paddingBottom = PaddingStyleValue.length(px(5));
		headerContainer.style.paddingLeft = PaddingStyleValue.length(px(5));
		headerContainer.style.paddingRight = PaddingStyleValue.length(px(5));
		headerContainer.style.marginBottom = MarginStyleValue.length(px(10));
		
		_header = getGraph();
		_header.style.width = DimensionStyleValue.auto;
		_header.style.height = DimensionStyleValue.length(px(300));
		_header.style.float = FloatStyleValue.left;
		
		
		headerContainer.addChild(_header);
		
		var siteLeftContainer:ContainerDOMElement = getContainer();
		siteLeftContainer.style.width = DimensionStyleValue.percent(70);
		siteLeftContainer.style.height = DimensionStyleValue.auto;

		
		_navigation = getGraph();
		_navigation.style.width = DimensionStyleValue.auto;
		_navigation.style.height = DimensionStyleValue.length(px(50));
		_navigation.style.paddingLeft = PaddingStyleValue.length(px(10));
		_navigation.style.paddingRight = PaddingStyleValue.length(px(10));
		_navigation.style.float = FloatStyleValue.left;
		
		var siteLeftTextContainer:ContainerDOMElement = getContainer();
		siteLeftTextContainer.style.paddingLeft = PaddingStyleValue.length(px(10));
		siteLeftTextContainer.style.paddingRight = PaddingStyleValue.length(px(10));
		
		siteLeftTextContainer.style.fontSize = FontSizeStyleValue.length(px(20));
		siteLeftTextContainer.style.lineHeight = LineHeightStyleValue.length(px(25));
	
		var textContainer:ContainerDOMElement = getContainer();
		
		textContainer.addText(NativeElementManager.createNativeTextNode("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus facilisis tortor sodales lacus pretium scelerisque dapibus est rhoncus. Aenean feugiat nulla vel libero imperdiet et iaculis nisl tristique. Pellentesque congue varius consectetur. Sed vulputate tristique ante, at ullamcorper odio adipiscing vitae. Cras interdum blandit ultricies. Pellentesque id lacus orci. Sed volutpat mi vel odio viverra molestie. Fusce rutrum purus accumsan lectus venenatis mattis at vel eros. Sed ac scelerisque neque. Donec et mi mollis ligula imperdiet euismod. Nunc ac consectetur orci. Morbi a enim lacus. Pellentesque dolor massa, vestibulum vitae placerat pretium, gravida suscipit nulla. Pellentesque est ipsum, egestas ut ullamcorper bibendum, dapibus at erat. Morbi purus lectus, aliquam at molestie in, sagittis ac magna. "));
		
		
		textContainer.style.textAlign = TextAlignStyleValue.left;
		//textContainer.style.whiteSpace = WhiteSpaceStyleValue.pre;
		
		textContainer.style.paddingLeft = PaddingStyleValue.length(px(200));
		textContainer.style.paddingRight = PaddingStyleValue.length(px(200));
		var siteLeftContainerChildren:ContainerDOMElement = getContainer();
		siteLeftContainerChildren.style.display = DisplayStyleValue._inline;
		siteLeftContainerChildren.addText(NativeElementManager.createNativeTextNode(" BOUM"));
		//siteLeftContainerChildren.style.verticalAlign = VerticalAlignStyleValue.middle;
		siteLeftContainerChildren.style.paddingRight = PaddingStyleValue.length(px(30));
		siteLeftContainerChildren.style.fontSize = FontSizeStyleValue.length(px(130));
		siteLeftContainerChildren.style.fontWeight = FontWeightStyleValue.bold;
		siteLeftContainerChildren.style.letterSpacing = LetterSpacingStyleValue.length(px(20));
		siteLeftContainerChildren.style.color = ColorValue.keyword(ColorKeywordValue.red);
		siteLeftContainerChildren.style.fontFamily = [FontFamilyStyleValue.genericFamily(GenericFontFamilyValue.serif)];
		
		var siteLeftContainerChildren2:ContainerDOMElement = getContainer();
		siteLeftContainerChildren2.style.display = DisplayStyleValue._inline;
		siteLeftContainerChildren2.addText(NativeElementManager.createNativeTextNode(" BADA"));
		siteLeftContainerChildren2.style.marginLeft = MarginStyleValue.length(px(50));
		siteLeftContainerChildren2.style.fontSize = FontSizeStyleValue.length(px(50));
		siteLeftContainerChildren2.style.fontStyle = FontStyleStyleValue.italic;
		siteLeftContainerChildren.addChild(siteLeftContainerChildren2);
		siteLeftContainerChildren2.style.textTransform = TextTransformStyleValue.capitalize;
		
		_insetGraphicElement = getGraph();
		_insetGraphicElement.style.width = DimensionStyleValue.length(px(20));
		_insetGraphicElement.style.height = DimensionStyleValue.length(px(120));
		_insetGraphicElement.style.display = DisplayStyleValue._inline;
		//textContainer.addChild(_insetGraphicElement);
		//textContainer.addChild(siteLeftContainerChildren);
		//textContainer.addText(NativeElementManager.createNativeTextNode(" consectetur adipiscing elit."));
		textContainer.style.position = PositionStyleValue.relative;
		textContainer.style.top = PositionOffsetStyleValue.length(em(2));
		textContainer.style.fontSize = FontSizeStyleValue.relativeSize(FontSizeRelativeSizeValue.smaller);
		//textContainer.style.lineHeight = LineHeightStyleValue.length(px(70));
		_siteLeftFloatBackground = getGraph();
		_siteLeftFloatBackground.style.width = DimensionStyleValue.length(px(50));
		_siteLeftFloatBackground.style.height = DimensionStyleValue.length(px(400)); 
			
		var siteLeftFloat:ContainerDOMElement = getContainer();
		siteLeftFloat.style.width = DimensionStyleValue.length(px(50));
		siteLeftFloat.style.float = FloatStyleValue.left;
		
		var siteLeftFloat2:ContainerDOMElement = getContainer();
		siteLeftFloat2.style.width = DimensionStyleValue.length(px(20));
		siteLeftFloat2.style.height = DimensionStyleValue.length(px(120));
		siteLeftFloat2.style.float = FloatStyleValue.left;
		
		var siteLeftAfterFloatBackgroundContainer:ContainerDOMElement = getContainer();
		siteLeftAfterFloatBackgroundContainer.style.width = DimensionStyleValue.auto;
		siteLeftAfterFloatBackgroundContainer.style.height = DimensionStyleValue.auto;
		
		_siteLeftAfterFloatBackground = getGraph();
		_siteLeftAfterFloatBackground.style.width = DimensionStyleValue.length(px(200));
		_siteLeftAfterFloatBackground.style.height = DimensionStyleValue.length(px(400));
		
		_siteLeftAfterFloatBackground2 = getGraph();
		_siteLeftAfterFloatBackground2.style.width = DimensionStyleValue.length(px(200));
		_siteLeftAfterFloatBackground2.style.height = DimensionStyleValue.length(px(50));
		_siteLeftAfterFloatBackground2.style.marginTop = MarginStyleValue.length(px(10));
		_siteLeftAfterFloatBackground2.style.float = FloatStyleValue.right;
		
		_siteLeftAfterFloatBackground3 = getGraph();
		_siteLeftAfterFloatBackground3.style.width = DimensionStyleValue.percent(40);
		_siteLeftAfterFloatBackground3.style.height = DimensionStyleValue.length(px(50));
		_siteLeftAfterFloatBackground3.style.paddingTop = PaddingStyleValue.length(px(5));
		
		siteLeftAfterFloatBackgroundContainer.addChild(_siteLeftAfterFloatBackground);
		siteLeftAfterFloatBackgroundContainer.addChild(_siteLeftAfterFloatBackground2);
		siteLeftAfterFloatBackgroundContainer.addChild(_siteLeftAfterFloatBackground3);
		
		siteLeftFloat.addChild(_siteLeftFloatBackground);
		
			
		siteLeftContainer.addChild(_navigation);
		siteLeftContainer.addChild(siteLeftTextContainer);
		siteLeftContainer.addChild(siteLeftFloat);
		siteLeftContainer.addChild(siteLeftAfterFloatBackgroundContainer);
		
		var siteRightLeftContainer:ContainerDOMElement = getContainer();
		siteRightLeftContainer.style.width = DimensionStyleValue.percent(100);
		siteRightLeftContainer.style.height = DimensionStyleValue.auto;
		
		siteRightLeftContainer.addChild(siteLeftContainer);
		
		
		var siteContainerRight:ContainerDOMElement = getContainer();
		siteContainerRight.style.width = DimensionStyleValue.percent(30);
		siteContainerRight.style.height = DimensionStyleValue.auto;
		
		
		_siteRightBackground = getGraph();
		_siteRightBackground.style.width = DimensionStyleValue.percent(100);
		_siteRightBackground.style.height = DimensionStyleValue.length(px(500));
		
		siteContainerRight.addChild(_siteRightBackground);
		
		 _footer = getGraph();
		_footer.style.width = DimensionStyleValue.percent(50);
		_footer.style.height = DimensionStyleValue.length(px(250));
		_footer.style.marginTop = MarginStyleValue.length(px(10));
		
		
		//_mainContainer.addChild(headerContainer);
		_mainContainer.addChild(textContainer);
		//_mainContainer.addChild(_footer);
		
		refresh();
		
		
		
	
	}
	
	private function paint(domElement:GraphicDOMElement, color:Int):Void
	{
		domElement.clear();
		domElement.beginFill(FillStyleValue.monochrome( { color:color, alpha:100 } ), LineStyleValue.none);
		domElement.drawRect(0, 0, domElement.width, domElement.height);
		domElement.endFill();
		domElement.alpha = 0.6;
		
	}
	
	private function refresh(event:Dynamic = null)
	{
		var browserWidth:Int;
		var browserHeight:Int;
		
		#if flash9
		browserWidth = Math.round(flash.Lib.current.stage.stageWidth);
		browserHeight = Math.round(flash.Lib.current.stage.stageHeight);
		#elseif js
		browserWidth = js.Lib.document.body.clientWidth;
		browserHeight = js.Lib.document.body.clientHeight;
		#end
		_mainContainer.style.computedStyle.lineHeight = 70;
		_mainContainer.style.layout( { width:browserWidth, height:browserHeight }, {width:browserWidth, height:browserHeight, globalX:0, globalY:0}, {width:browserWidth, height:browserHeight, globalX:0, globalY:0}, _mainContainer.style.fontMetrics);
	
		paint(_background, 0x222222);
		paint(_siteBackground, 0xFFFFFF);
		paint(_header, 0xDDDDDD);
		paint(_navigation, 0xDDDDDD);
		paint(_siteRightBackground, 0xDDDDDD);
		paint(_footer, 0xBBBBBB);
		paint(_siteLeftFloatBackground, 0xBBBBBB);
		paint(_siteLeftAfterFloatBackground, 0x00000);
		paint(_siteLeftAfterFloatBackground2, 0x00000);
		paint(_siteLeftAfterFloatBackground3, 0x222222);
		paint(_insetGraphicElement, 0xFF0000);
	}
	
	private function attach(domElement:DOMElement):Void
	{
		#if flash9
		flash.Lib.current.addChild(domElement.nativeElement);
		#elseif js
		js.Lib.document.body.appendChild(domElement.nativeElement);
		#end
	}
	
	private function getContainer():ContainerDOMElement
	{
		var ret:ContainerDOMElement = new ContainerDOMElement(NativeElementManager.createNativeElement(neutral));
		getDefaultStyle(ret);
		
		ret.x = 0;
		ret.y = 0;
		return ret;
	}
	

	
	private function getGraph():GraphicDOMElement
	{
		
		
		var ret:GraphicDOMElement = new GraphicDOMElement();
		
		getDefaultStyle(ret);
		
		return ret;
	}
	
	
	private function getDefaultStyle(domElement:DOMElement):Void
	{
			domElement.style.marginLeft = MarginStyleValue.length(px(0));
			domElement.style.marginRight = MarginStyleValue.length(px(0));
			domElement.style.marginTop = MarginStyleValue.length(px(0));
			domElement.style.marginBottom = MarginStyleValue.length(px(0));
			
			domElement.style.paddingLeft = PaddingStyleValue.length(px(0));
			domElement.style.paddingRight = PaddingStyleValue.length(px(0));
			domElement.style.paddingTop = PaddingStyleValue.length(px(0));
			domElement.style.paddingBottom = PaddingStyleValue.length(px(0));
			
			domElement.style.top = PositionOffsetStyleValue.length(px(0));
			domElement.style.left = PositionOffsetStyleValue.length(px(0));
			domElement.style.right = PositionOffsetStyleValue.length(px(0));
			domElement.style.bottom  = PositionOffsetStyleValue.length(px(0));
			
			domElement.style.minWidth = ConstrainedDimensionStyleValue.none;
			domElement.style.maxWidth = ConstrainedDimensionStyleValue.none;
			domElement.style.minHeight = ConstrainedDimensionStyleValue.none;
			domElement.style.maxHeight = ConstrainedDimensionStyleValue.none;
			

			
			domElement.style.fontSize = FontSizeStyleValue.length(px(12));
			domElement.style.lineHeight = LineHeightStyleValue.normal;
			domElement.style.fontWeight = FontWeightStyleValue.normal;
			domElement.style.fontStyle = FontStyleStyleValue.normal;
			domElement.style.fontFamily = [FontFamilyStyleValue.genericFamily(GenericFontFamilyValue.sansSerif)];
			domElement.style.fontVariant = FontVariantStyleValue.normal;
			domElement.style.textTransform = TextTransformStyleValue.none;
			domElement.style.letterSpacing = LetterSpacingStyleValue.normal;
			domElement.style.wordSpacing = WordSpacingStyleValue.normal;
			domElement.style.textIndent = TextIndentStyleValue.length(px(0));
			domElement.style.whiteSpace = WhiteSpaceStyleValue.normal;
			domElement.style.textAlign = TextAlignStyleValue.left;
			
			domElement.style.verticalAlign = VerticalAlignStyleValue.baseline;
			
			domElement.style.color = ColorValue.keyword(ColorKeywordValue.black);
			
			domElement.style.display = block;
			
			domElement.style.position = _static;
			
			domElement.style.width = DimensionStyleValue.auto;
			domElement.style.height = DimensionStyleValue.auto;
			
			domElement.style.float = FloatStyleValue.none;
			domElement.style.clear = ClearStyleValue.none;
		
	}
	
}