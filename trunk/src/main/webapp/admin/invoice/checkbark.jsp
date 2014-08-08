<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
	String id = request.getParameter("id");
	if (id == null) {
		id = "";
	}
%>
<html>
<head>
<jsp:include page="/include/easyui.jsp"></jsp:include>
<link rel="stylesheet" href="../../style/css/dialog.css" type="text/css">
<script type="text/javascript" src="../../js/question.js" charset="utf-8"></script>
<link rel="stylesheet" href="../../jslib/kindeditor-4.1.10/themes/default/default.css" />
<link rel="stylesheet" href="../../jslib/kindeditor-4.1.10/plugins/code/prettify.css" />
<script charset="utf-8" src="../../jslib/kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8" src="../../jslib/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script charset="utf-8" src="../../jslib/kindeditor-4.1.10/plugins/code/prettify.js"></script>
<script type="text/javascript" charset="utf-8">
var question;
var contentEditor;
$(function() {
	$.ajax({
		url : '${pageContext.request.contextPath}/questionController/admin/getById.do?id='+$('#id').val(),
		type : 'GET',
		dataType : 'json',
		success : function(data) {
			if (data.success) {
				question = data.obj;
				contentEditor.html(question.content);
				contentEditor.readonly(true);
				
				$('#difficulty').attr('value',question.difficulty);
				
				$('#category').combobox('select', question.categoryId);
				
				$('#subject').combobox({
				    url:'${pageContext.request.contextPath}/subjectController/admin/getAll.do',
				    valueField:'id',
				    textField:'name',
				    mode:'remote',
				    method:'get', 
				    panelHeight:'auto',
				    editable:false,
				    onLoadSuccess:function(){
				    	$('#subject').combobox('select', question.subject.id);
				    }
				});
				
				$('#type').combobox({
				    url:'${pageContext.request.contextPath}/questionTypeController/admin/getAll.do',
				    valueField:'id',
				    textField:'name',
				    mode:'remote',
				    method:'get', 
				    panelHeight:'auto',
				    editable:false,
				    onBeforeLoad:function(row){
				    	changeType();
				    },
					onSelect:function(row){
						changeType();
					},
				    onLoadSuccess:function(){
				    	$('#type').combobox('select', question.questionType.id);
				    	switch (question.questionType.id) {
							case 1:
								$('#choice_select_option_nums').combobox('select', question.questionOptions.length);
								changeOption();
								var i = 0;
								$('#choice_option_input input').each(function() {
									$(this).attr('value',question.questionOptions[i].content);
									$(this).validatebox('validate');
									$(this).attr('disabled',true);
									i++;
								});
								$('#choice_answer_input input').attr('value',question.answers[0].content);
								$('#choice_answer_input input').validatebox('validate');
								$('#choice_answer_input input').attr('disabled',true);
								break;
							case 2:
								var j = 0;
								for(j=1;j<question.answers.length;j++){
									$('#fill_answer_input').append('<input type="text" class="easyui-validatebox" placeholder="请输入正确内容" data-options="required:true"/><br/>');
								}
								$.parser.parse($('#fill_answer_input'));
								var i = 0;
								$('#fill_answer_input input').each(function() {
									$(this).attr('value',question.answers[i].content);
									$(this).validatebox('validate');
									$(this).attr('disabled',true);
									i++;
								});
								break;
							case 3:
								if(question.answers[0].content=='1'){
									$('#decide_right_answer').attr('checked',true);
									$('#decide_right_answer').attr('disabled',true);
								}
								else{
									$('#decide_wrong_answer').attr('checked',true);
									$('#decide_right_answer').attr('disabled',true);
								}
								break;
							default:
								break;
						}
				    }
				});

				$('#knowledge').combobox({
				    url:'${pageContext.request.contextPath}/knowledgeController/admin/getAll.do',
				    valueField:'id',
				    textField:'content',
				    mode:'remote',
				    method:'get', 
				    panelHeight:'auto',
				    editable:false,
				    onLoadSuccess:function(){
				    	$('#knowledge').combobox('select', question.knowledge.id);
				    }
				});
				
				$('#choice_select_option_nums').combobox({
					onSelect:function(row){
						changeOption();
					}
				});
				
			}else{
				parent.$.modalDialog.handler.dialog('close');
				parent.$.messager.show({
					title : '提示',
					msg : data.msg,
					timeout : 2000,
					showType : 'slide'
				});
			}
		},
		error : function() {
		}
	});
});

KindEditor.ready(function(K) {
	contentEditor = K.create('#content',
					{
						minWidth : '550px',
						minHeight : '200px',
						width : '550px',
						height : '200px',
						items : ['undo', 'redo', '|', 'code',
								'cut', 'copy', 'paste',
								'subscript', 'superscript', '|',
								'image', 'preview'],
						uploadJson : '${pageContext.request.contextPath}/fileController/upload.do?type=question',
						fileManagerJson : '${pageContext.request.contextPath}/fileController/getFiles.do?type=question',
						allowFileManager : true,
						afterCreate : function() {
							this.sync();
						},
						afterBlur : function() {
							this.sync();
						}
					});
	});
	
	function setEditable(){
		contentEditor.readonly(false);
		$('#admin_question_check_form input,textarea,select').attr('disabled', false);
		$('#submit').linkbutton('enable');
		if(question.questionType.id == 2)
			$('#fill_answer_input_util_button').css('display', '');
	}

	function submit() {
		if ($('#admin_question_add_form').form('validate')) {
			$('#submit').linkbutton('disable');
			var data = toJson();
			$.ajax({
						url : '${pageContext.request.contextPath}/questionController/admin/edit.do',
						type : 'POST',
						data : data,
						dataType : 'json',
						contentType : 'application/json; charset=utf-8',
						success : function(data) {
							if (data.success) {
								parent.$.modalDialog.DataGrid.datagrid(
										'updateRow', {
											index : parent.$.modalDialog.DataGrid.datagrid('getRowIndex',$('#id').val()),
											row : data.obj
										});
								parent.$.modalDialog.handler.dialog('close');
							}
							parent.$.messager.show({
								title : '提示',
								msg : data.msg,
								timeout : 2000,
								showType : 'slide'
							});
							$('#submit').linkbutton('enable');
						},
						error : function() {
							parent.$.messager.show({
								title : '提示',
								msg : '添加失败！',
								timeout : 2000,
								showType : 'slide'
							});
							$('#submit').linkbutton('enable');
						}
					});
		}
	}
	function reset() {
		$('#admin_user_add_form').form('clear');
	}
</script>
</head>
<body>
	<form id="admin_question_check_form">
		<table>
			<tr>
				<td><input id="id" name="id" value="<%=id%>" type="hidden"></input></td>
			</tr>
			<tr>
				<td>题目内容</td>
				<td><textarea id="content" class="easyui-validatebox" placeholder="请输入题目内容" data-options="required:true" disabled="disabled"></textarea></td>
			</tr>
			<tr>
				<td>所属科目</td>
				<td><select id="subject" disabled="disabled" class="easyui-combobox" data-options="required:true" style="width:150px;">
				</select></td>
			</tr>
			<tr>
				<td>所属知识点</td>
				<td><select id="knowledge" disabled="disabled" class="easyui-combobox" data-options="required:true" style="width:150px;">
				</select></td>
			</tr>
			<tr>
				<td>题型选择</td>
				<td><select id="type" disabled="disabled" class="easyui-combobox" data-options="required:true" style="width:150px;">
				</select></td>
			</tr>
			<tr id="choice_select_div">
				<td>选项个数</td>
				<td><select id="choice_select_option_nums" disabled="disabled" class="easyui-combobox" data-options="panelHeight:'auto',required:true" style="width:150px;">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
				</select></td>
			</tr>

			<tr id="choice_option_input_div">
				<td>选项</td>
				<td id="choice_option_input"></td>
			</tr>
			
			<tr id="choice_answer_input_div">
				<td>正确答案</td>
				<td id="choice_answer_input"></td>
			</tr>
			 
			<tr id="fill_answer_input_div">
				<td>正确答案</td>
				<td id="fill_answer_input"></td>
			</tr>
			<tr id="fill_answer_input_util_div">
				<td></td>
				<td id="fill_answer_input_util_button" style="display: none"><a href="javascript:void(0)" onclick="addAnswer()">增加一个空的答案</a>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="removeAnswer()">减少一个空的答案</a></td>
			</tr>

			<tr id="decide_answer_radio_div">
				<td>正确答案</td>
				<td><input id="decide_right_answer" type="radio" name="answer" checked="checked" disabled="disabled"/><span>正确</span><input id="decide_wrong_answer" type="radio" name="answer" disabled="disabled"/><span>错误</span></td>
			</tr>
			<tr>
				<td>该题所属分类</td>
				<td><select id="category" disabled="disabled" class="easyui-combobox" data-options="required:true" style="width:150px;">
						<option value="1">考试试题</option>
						<option value="2">练习习题</option>
				</select></td>
			</tr>
			<tr>
				<td>难度系数</td>
				<td><input id="difficulty" type="text" placeholder="默认3（选填）" disabled="disabled"/></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;">
					<sec:authorize url="/questionController/admin/edit.do">
						<a href="#" class="easyui-linkbutton" onclick="setEditable()">修改</a>
						<a id="submit" href="#" class="easyui-linkbutton" data-options="disabled:'true'" onclick="submit()">保存</a>
					</sec:authorize>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

