/*	Copyright (c) 2015 Wang Leone
 *	Licensed under the MIT license
 *========================================================================== 
 * 
 * 类别输入框点击事件
 */
function click_category(obj) {
	$('#category-select').show(500);
	$('#category').css('color', '#009ACD');

	var oldContent = $("#category").val();
	// 点击前若提示继续选择则去除 "继续选择"
	if (oldContent.indexOf("继续选择...") >= 0) {
		oldContent = oldContent.substring(0, oldContent.indexOf('  〉') + 3);
		$("#category").val(oldContent);
	}
}

/*
 * 点击非类别选项部分隐藏类别选项 div
 */
$(document).bind(
		'click',
		function(e) {
			var e = e || window.event; // 浏览器兼容性
			var elem = e.target || e.srcElement;
			while (elem) { // 循环判断至跟节点，防止点击的是 div 子元素
				if ((elem.id && elem.id == 'category')
						|| (elem.id && elem.id == 'category-select')) {
					return;
				}
				elem = elem.parentNode;
			}

			$('#category-select').hide(500); // 点击的不是 div 或其子元素

			var oldContent = $("#category").val();
			// 判断是否有此类别,没有则清空
			if (oldContent.indexOf("  〉") < 0) {
				$("#category").val("");
			}
			// 判断是否选择完全,若不完全,提示继续选择
			if ((oldContent.indexOf("  〉") + 3) == oldContent.length) {
				$("#category").val(oldContent + " 继续选择...");
				$('#category').css('color', 'red');
			}
		});

/*
 * 类别选项一级菜单选择
 */
function change_category(obj) {
	var content = obj.innerHTML;
	$("#category").val(content + "   〉");
}

/*
 * 类别选项二级菜单选择
 */
function get_category(obj) {
	var content = obj.innerHTML;
	var oldContent = $("#category").val();
	// 截取 -> 前的字符,防止字符错误
	oldContent = oldContent.substring(0, oldContent.indexOf('  〉') + 3);
	$("#category").val(oldContent + " " + content);
	$('#category-select').hide(500);

}