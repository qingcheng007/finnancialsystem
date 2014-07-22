<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="../../include/easyui.jsp"></jsp:include>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/exam.js" charset="utf-8"></script> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/css/dialog.css" type="text/css">
<script type="text/javascript" charset="utf-8">
	var questionTypeArray;
	var knowledgeArray;
	var randomId = 0;
	$(function() {
		$('#subject')
				.combobox(
						{
							url : '${pageContext.request.contextPath}/invoiceController/getAllTest.do',
							valueField : 'id',
							textField : 'name',
							mode : 'remote',
							method : 'get',
							panelHeight : 'auto',
							editable : false
						});
		
		$('#struct_quantity').combobox({
			onSelect:function(row){
				changeStruct();
			}
		});
	});

	function changeStruct() {
		$('#struct_div').empty();
		var k = parseInt($('#struct_quantity').combobox('getValue'));
		if (k > 0) {
			for ( var i = 1; i < k + 1; i++) {
				$('#struct_div')
						.append(
								'<fieldset class="struct"><legend>第'
										+ i
										+ '大题</legend><table><tr><td>标题</td><td><input type="text" class="easyui-validatebox" placeholder="请输入这一大题的标题" data-options="required:true"/></td></tr><tr><td>题型选择</td><td><select id="type'+randomId+'" class="easyui-combobox" data-options="url:\'${pageContext.request.contextPath}/questionTypeController/admin/getAll.do\',valueField:\'id\',textField:\'name\',mode:\'remote\',method:\'get\', panelHeight:\'auto\',editable:false,required:true" style="width:150px;"></select></td></tr><tr><td>分值</td><td><input type="text" placeholder="请输入每题的分值" class="easyui-numberspinner" data-options="min:1,srequired:true"/></td></tr><tr><td>题目数量</td><td><input type="text" placeholder="请输入题目数量" class="easyui-numberspinner" data-options="min:1,srequired:true"/></td></tr> <tr><td colspan="2"><a href="javascript:void(0)" onclick="addKnowledge(this)">增加一个知识点分布</a>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="removeKnowledge(this)">删除一个知识点分布</a></td></tr> </table></fieldset>');
				randomId++;	
			}
			$.parser.parse($('#struct_div'));
		}
	}

	function addKnowledge(obj) {
		$(obj).parent()
				.parent()
				.before(
						'<tr><td colspan="2"><fieldset><table><tr><td>请选择知识点</td><td><select id="knowledge"'+randomId+' class="easyui-combobox" data-options="url:\'${pageContext.request.contextPath}/knowledgeController/admin/getAll.do\',valueField:\'id\',textField:\'content\',mode:\'remote\',method:\'get\', panelHeight:\'auto\', editable:false,required:true" style="width:150px;"></select></td></tr><tr><td>请选择难度</td><td><input class="easyui-numberspinner" data-options="min:1,max:5,required:true"></input></td></tr><tr><td>请选择题目数量</td><td><input class="easyui-numberspinner" data-options="min:1,required:true"></input></td></tr></table></fieldset></td></tr>');
		randomId++;
		$.parser.parse($(obj).parent().parent().prev());
	}

	function removeKnowledge(obj) {
		$(obj).parent().parent().prev().remove();
	}

	function submit() {
		if ($('#admin_exam_add_form').form('validate')) {
			$('#submit').linkbutton('disable');
			var data = toJson();
			$
					.ajax({
						url : '${pageContext.request.contextPath}/examController/admin/add.do',
						type : 'POST',
						data : data,
						dataType : 'json',
						contentType : 'application/json; charset=utf-8',
						success : function(data) {
							if (data.success) {
								parent.$.modalDialog.DataGrid.datagrid(
										'insertRow', {
											index : 0,
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

	function toJson() {
		var exam = new Object();
		if ($('#id').val() != null)
			exam.id = $('#id').val();
		exam.title = $('#title').val();

		var subject = new Object();
		
		subject.id = $('#subject').combobox('getValue');
		subject.name = $('#subject').combobox('getText');
		exam.subject = subject;

		exam.limitTime = $('#limitTime').val();
		exam.score = $('#score').val();

		var examStructs = new Array();
		$('#struct_div .struct').each(function() {
			var examStruct = new Object();
			var first = $(this).find('input').first();
			examStruct.title = first.val();
			
			var questionType = new Object();
			var second = first.parent().parent().next().find('select');
			questionType.id = second.combobox('getValue');
			questionType.name = second.combobox('getText');
			examStruct.questionType = questionType;
			
			var third = second.parent().parent().next().find('input');
			examStruct.score = third.val();
			
			var fourth = third.parent().parent().next().find('input');
			examStruct.quantity = fourth.val();
			
			var knowledges = new Array();
			var temp = fourth;
			console.info("four"+temp);
			
			while((temp = temp.parent().parent().next().find('fieldset'))!= null){
				console.info(temp);
				var knowledge = new Object();
				
				var k1 = temp.find('select').first();
				console.info(k1);
				knowledge.id = k1.combobox('getValue');
				knowledge.content = k1.combobox('getText');
				
				var k2 = k1.parent().parent().next().find('input');
				console.info(k2);
				knowledge.difficulty = k2.val();
				
				var k3 = k2.parent().parent().next().find('input');
				console.info(k3);
				knowledge.quantity = k3.val();
				
				knowledges.push(knowledge);
			}
			
			examStruct.sequence = i + 1;
			examStructs.push(examStruct);
		});

		exam.examStructs = examStructs;
		exam.categoryId = $('#category').combobox('getValue');
		if ($('#amount').val() == '')
			exam.amount = 1;
		else
			exam.amount = $('#amount').val();
		exam.isRandom = $('#isRandom').is(':checked') ? 1 : 0;
		if ($('#difficulty').val() == '')
			exam.difficulty = 60;
		else
			exam.difficulty = $('#difficulty').val();
		exam.isScoreNow = $('#isScoreNow').is(':checked') ? 1 : 0;
		exam.remark = $('#remark').val();

		return JSON.stringify(exam);
	}
</script>
</head>
<body>
	<form id="admin_exam_add_form">
		<table>
			<tr>
				<td>标题</td>
				<td><textarea id="title" class="easyui-validatebox" placeholder="请输入试卷标题" data-options="required:true"></textarea></td>
			</tr>
			<tr>
				<td>所属科目</td>
				<td><select id="subject" class="easyui-combobox" data-options="required:true" style="width:150px;">
				</select></td>
			</tr>
			<tr>
				<td>考试时长</td>
				<td><input id="limitTime" placeholder="请输入考试时长" class="easyui-numberspinner" data-options="min:1,max:1000,required:true"/></td>
			</tr>
			<tr>
				<td>满分</td>
				<td><input id="score" placeholder="请输入试卷满分" class="easyui-numberspinner" data-options="min:1,max:1000,required:true"/></td>
			</tr>
			<tr>
				<td>共几大题</td>
				<td><select id="struct_quantity" class="easyui-combobox" data-options="panelHeight:'auto',required:true" style="width:150px;">
						<option value="0">请选择数量</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
				</select></td>
			</tr>
			<tr>
				<td id="struct_div" colspan="2"></td>
			</tr>
			<tr>
				<td>是否知识点随机分配</td>
				<td><input id="isRandom" name="isRandom" type="checkbox" /></td>
			</tr>
			<tr>
				<td>随机生成多少套试卷</td>
				<td><input id="amount" placeholder="默认1套" class="easyui-numberspinner" data-options="min:1,srequired:true"/></td>
			</tr>
			<tr>
				<td>该试卷所属分类</td>
				<td><select id="category" class="easyui-combobox" data-options="panelHeight:'auto',required:true" style="width:150px;">
						<option value="1">考试试题</option>
						<option value="2">练习习题</option>
				</select></td>
			</tr>

			<tr>
				<td>试卷难度</td>
				<td><input id="difficulty" placeholder="默认3" class="easyui-numberspinner" data-options="min:1,max:5"/></td>
			</tr>
			<tr>
				<td>答完题后是否立即算分</td>
				<td><input id="isScoreNow" name="isScoreNow" type="checkbox" /></td>
			</tr>
			<tr>
				<td>备注</td>
				<td><input id="remark" placeholder="请输入备注信息（选填）" /></td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: center;"><a href="#" class="easyui-linkbutton" onclick="reset()">重置</a> <a id="submit" href="#" class="easyui-linkbutton" onclick="submit()">提交</a></td>
			</tr>
		</table>
	</form>
</body>
</html>

