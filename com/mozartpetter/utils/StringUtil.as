//
//   Copyright 2009 - 2011 Mozart Petter
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//
package com.mozartpetter.utils {
	
	/**
	 * StringUtil Class
	 *
	 * @author Mozart Petter 
	 * @since Jan 1, 2009
	 */
	public class StringUtil {
		
		//----------------------------------------------
		// Private Properties
		//----------------------------------------------
		
		private static var _htmlEntitiesList:Array = ["&amp;", "&nbsp;", "&iexcl;", "&cent;", "&pound;", 
		"&curren;", "&yen;", "&brvbar;", "&sect;", "&uml;", "&copy;", "&ordf;", "&laquo;", 
		"&not;", "&shy;", "&reg;", "&macr;", "&deg;", "&plusmn;", "&sup2;", "&sup3;", 
		"&acute;", "&micro;", "&para;", "&middot;", "&cedil;", "&sup1;", "&ordm;", 
		"&raquo;", "&frac14;", "&frac12;", "&frac34;", "&iquest;", "&Agrave;","&Aacute;", 
		"&Acirc;", "&Atilde;", "&Auml;", "&Aring;", "&AElig;", "&Ccedil;", "&Egrave;", 
		"&Eacute;", "&Ecirc;", "&Euml;", "&Igrave;", "&Iacute;", "&Icirc;", "&Iuml;", 
		"&ETH;", "&Ntilde;", "&Ograve;", "&Oacute;", "&Ocirc;", "&Otilde;", "&Ouml;", 
		"&times;", "&Oslash;", "&Ugrave;", "&Uacute;", "&Ucirc;", "&Uuml;", "&Yacute;", 
		"&THORN;", "&szlig;", "&agrave;", "&aacute;", "&acirc;", "&atilde;", "&auml;", 
		"&aring;", "&aelig;", "&ccedil;", "&egrave;", "&eacute;", "&ecirc;", "&euml;", 
		"&igrave;", "&iacute;", "&icirc;", "&iuml;", "&eth;", "&ntilde;", "&ograve;", 
		"&oacute;", "&ocirc;", "&otilde;", "&ouml;", "&divide;", "&oslash;", "&ugrave;", 
		"&uacute;", "&ucirc;", "&uuml;", "&yacute;", "&thorn;", "&yuml;", "&fnof;", 
		"&Alpha;", "&Beta;", "&Gamma;", "&Delta;", "&Epsilon;", "&Zeta;", "&Eta;", 
		"&Theta;", "&Iota;", "&Kappa;", "&Lambda;", "&Mu;", "&Nu;", "&Xi;", "&Omicron;", 
		"&Pi;", "&Rho;", "&Sigma;", "&Tau;", "&Upsilon;", "&Phi;", "&Chi;", "&Psi;", 
		"&Omega;", "&alpha;", "&beta;", "&gamma;", "&delta;", "&epsilon;", "&zeta;", 
		"&eta;", "&theta;", "&iota;", "&kappa;", "&lambda;", "&mu;", "&nu;", "&xi;", 
		"&omicron;", "&pi;", "&rho;", "&sigmaf;", "&sigma;", "&tau;", "&upsilon;", "&phi;", 
		"&chi;", "&psi;", "&omega;", "&thetasym;", "&upsih;", "&piv;", "&bull;", "&hellip;", 
		"&prime;", "&Prime;", "&oline;", "&frasl;", "&weierp;", "&image;", "&real;", 
		"&trade;", "&alefsym;", "&larr;", "&uarr;", "&rarr;", "&darr;", "&harr;", "&crarr;", 
		"&lArr;", "&uArr;", "&rArr;", "&dArr;", "&hArr;", "&forall;", "&part;", "&exist;", 
		"&empty;", "&nabla;", "&isin;", "&notin;", "&ni;", "&prod;", "&sum;", "&minus;", 
		"&lowast;", "&radic;", "&prop;", "&infin;", "&ang;", "&and;", "&or;", "&cap;", 
		"&cup;", "&int;", "&there4;", "&sim;", "&cong;", "&asymp;", "&ne;", "&equiv;", "&le;", 
		"&ge;", "&sub;", "&sup;", "&nsub;", "&sube;", "&supe;", "&oplus;", "&otimes;", "&perp;", 
		"&sdot;", "&lceil;", "&rceil;", "&lfloor;", "&rfloor;", "&lang;", "&rang;", "&loz;", 
		"&spades;", "&clubs;", "&hearts;", "&diams;", "&quot;", "<", ">", "&OElig;", 
		"&oelig;", "&Scaron;", "&scaron;", "&Yuml;", "&circ;", "&tilde;", "&ensp;", "&emsp;", 
		"&thinsp;", "&zwnj;", "&zwj;", "&lrm;", "&rlm;", "&ndash;", "&mdash;", "&lsquo;", 
		"&rsquo;", "&sbquo;", "&ldquo;", "&rdquo;", "&bdquo;", "&dagger;", "&Dagger;", 
		"&permil;", "&lsaquo;", "&rsaquo;", "&euro;"];
		
		private static var _specialCharsList:Array = ["&"," ", "¡", "¢", "£", "¤", "¥", "¦", "§", "¨", "©", 
		"ª", "«", "¬", " ", "®", "¯", "°", "±", "²", "³", "´", "µ", "¶", "·", "¸", "¹", "º", "»", 
		"¼", "½", "¾", "¿", "À","Á", "Â", "Ã", "Ä", "Å", "Æ", "Ç", "È", "É", "Ê", "Ë", "Ì", "Í", 
		"Î", "Ï", "Ð", "Ñ", "Ò", "Ó", "Ô", "Õ", "Ö", "×", "Ø", "Ù", "Ú", "Û", "Ü", "Ý", "Þ", "ß", 
		"à", "á", "â", "ã", "ä", "å", "æ", "ç", "è", "é", "ê", "ë", "ì", "í", "î", "ï", "ð", "ñ", 
		"ò", "ó", "ô", "õ", "ö", "÷", "ø", "ù", "ú", "û", "ü", "ý", "þ", "ÿ", "ƒ", "Α", "Β", "Γ", 
		"Δ", "Ε", "Ζ", "Η", "Θ", "Ι", "Κ", "Λ", "Μ", "Ν", "Ξ", "Ο", "Π", "Ρ", "Σ", "Τ", "Υ", "Φ", 
		"Χ", "Ψ", "Ω", "α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "ι", "κ", "λ", "μ", "ν", "ξ", "ο", 
		"π", "ρ", "ς", "σ", "τ", "υ", "φ", "χ", "ψ", "ω", "ϑ", "ϒ", "ϖ", "•", "…", "′", "″", "‾", 
		"⁄", "℘", "ℑ", "ℜ", "™", "ℵ", "←", "↑", "→", "↓", "↔", "↵", "⇐", "⇑", "⇒", "⇓", "⇔", "∀", 
		"∂", "∃", "∅", "∇", "∈", "∉", "∋", "∏", "∑", "−", "∗", "√", "∝", "∞", "∠", "∧", "∨", "∩", 
		"∪", "∫", "∴", "∼", "≅", "≈", "≠", "≡", "≤", "≥", "⊂", "⊃", "⊄", "⊆", "⊇", "⊕", "⊗", "⊥", 
		"⋅", "⌈", "⌉", "⌊", "⌋", "〈", "〉", "◊", "♠", "♣", "♥", "♦", "\"", "<", ">", "Œ", "œ", 
		"Š", "š", "Ÿ", "ˆ", "˜", " ", " ", " ", "‌", "‍", "‎", "‏", "–", "—", "‘", "’", "‚", "“", 
		"”", "„", "†", "‡", "‰", "‹", "›", "€"];
		
	//----------------------------------------------------------------------------------------------
	//
	//  Public Methods
	//  
	//----------------------------------------------------------------------------------------------
		
		/**
		 * Capitalize all or only the first word of the string.
		 * 
		 * @param value String Value to be modified.
		 * @param all Boolean Indicate if all words will be affected.
		 */
		public static function capitalize(value:String, all:Boolean = true):String {
			var regexp:RegExp = /^([^\s])/;
			if (all) {
				regexp = /^([^\s])|\b([^\s])/g;
			}
			return value.replace(regexp, StringUtil.toUpperCase);
		}
		
		/**
		 * Converts all chars from the given string to html entities.
		 * 
		 * @param value
		 */
		public static function htmlEscape(value:String):String {
			return StringUtil.replaceAll(value, StringUtil._specialCharsList, StringUtil._htmlEntitiesList);
		}
		
		/**
		 * Converts all html entities from the given string.
		 * 
		 * @param value
		 */
		public static function htmlUnescape(value:String):String {
			return StringUtil.replaceAll(value, StringUtil._htmlEntitiesList, StringUtil._specialCharsList);
		}
		
		/**
		 * Replaces all the occurences of find into value by replace.
		 * 
		 * @param value
		 * @param find
		 * @param replace
		 */
		public static function replaceAll(value:String, find:*, replace:*):String {
			if (find is Array && replace is Array) {
				var count:int = 0;
				for each (var fString:String in find) {
					var rString:String = replace[count];
					value = replaceAll(value, fString, rString);
					count++;
				}
			} else {
				value = value.split(find).join(replace);
			}
			return value;
		}
		
		/**
		 * Removes all spaces from beginning and the end of the value string.
		 * 
		 * @param value
		 */
		public static function trim(value:String):String {
			if (!value) return '';
			
			return value.replace(/^\s*|\s*$/g, '');
		}
		
		/**
		 * Removes all spaces from the beginning of the value string.
		 * 
		 * @param value
		 */
		public static function trimLeft(value:String):String {
			if (!value) return '';
			
			return value.replace(/^\s*|\s*$/g, '');
		}
		
		/**
		 * Removes all spaces from the end of the value string.
		 * 
		 * @param value
		 */
		public static function trimRight(value:String):String {
			if (!value) return '';
			
			return value.replace(/^\s*|\s*$/g, '');
		}
		
	//----------------------------------------------------------------------------------------------
	//
	//  Private Methods
	//  
	//----------------------------------------------------------------------------------------------
		
		private static function toUpperCase(value:String, ...args):String {
			return value.toUpperCase();
		}
	}
}