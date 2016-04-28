<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>test</title>

<!-- Bootstrap -->
<link href="/static/css/bootstrap.min.css" rel="stylesheet">
  <link href="data:text/css;charset=utf-8," data-href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" rel="stylesheet" id="bs-theme-stylesheet">

<link href="/static/css/jquery-ui.theme.min.css" rel="stylesheet">
<link href="/static/css/docs.min.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
<!--
body {
	padding-top: 50px;
}

.starter-template {
	padding: 40px 15px;
	text-align: center;
}
 #sortable1, #sortable2{ list-style-type: none; margin: 0; padding: 0; width: 450px; float:left}
  #sortable1 li, #sortable2 li{ margin: 3px 3px 3px 0; padding: 1px; float: left; width: 100px; height: 90px; font-size: 4em; text-align: center; }

-->
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Project name</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">首页</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">

		<div class="starter-template">
			<h1>拖曳测试</h1>
		</div>
		<p class="lead">请任意拖动下面的图片</p>
		<ul id="sortable1" class="connectedSortable">
			<li class="ui-state-default">1</li>
			<li class="ui-state-default"></li>
			<li class="ui-state-default">3</li>
			<li class="ui-state-default"></li>
			<li class="ui-state-default">5</li>
			<li class="ui-state-default"></li>
			<li class="ui-state-default">7</li>
			<li class="ui-state-default"></li>
		</ul>

		<ul id="sortable2" class="connectedSortable">
			<li class="ui-state-default"></li>
			<li class="ui-state-default">10</li>
			<li class="ui-state-default"></li>
			<li class="ui-state-default">12</li>
			<li class="ui-state-default"></li>
			<li class="ui-state-default">14</li>
			<li class="ui-state-default"></li>
			<li class="ui-state-default">16</li>
		</ul>
		<div style="width: 400px;float: right;">
			<button id="clear" type="button" class="btn btn-danger" style="margin-top: 20px;">复位</button>
		</div>
		<a href="/reactjs" target="_blank">reactjs测试</a>
	</div>
	
	<!-- /.container -->
	<script src="/static/js/jquery.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/jquery-ui.min.js"></script>
	<script>
  		$(function() {
			$( "#sortable1, #sortable2" ).sortable({
							      connectWith: ".connectedSortable",
							       cursor: "move",
							       helper: "clone" 
    		}).disableSelection();
    		$("#clear").click(function(){
    			$( "#sortable1, #sortable2" ).sortable( "cancel" );
    		});
		});
		
	</script>
    <script type="text/jsx">
        var ProductCategoryRow = React.createClass({
            render: function() {
                return (<tr><th colSpan="2">{this.props.category}</th></tr>);
            }
        });

        var ProductRow = React.createClass({
            render: function() {
                var name = this.props.product.stocked ?
                        this.props.product.name :
                        <span style={{color: 'red'}}>
                            {this.props.product.name}
                        </span>;
                return (
                        <tr>
                            <td>{name}</td>
                            <td>{this.props.product.price}</td>
                        </tr>
                );
            }
        });
        var ProductTable = React.createClass({
            render: function() {
                var rows = [];
                var lastCategory = null;
                this.props.products.forEach(function(product) {
                    if (product.name.indexOf(this.props.filterText) === -1 || (!product.stocked && this.props.inStockOnly)) {
                        return;
                    }
                    if (product.category !== lastCategory) {
                        rows.push(<ProductCategoryRow category={product.category} key={product.category} />);
                    }
                    rows.push(<ProductRow product={product} key={product.name} />);
                    lastCategory = product.category;
                }.bind(this));
                return (
                        <table>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>{rows}</tbody>
                        </table>
                );
            }
        });

        var SearchBar = React.createClass({
            handleChange: function() {
                this.props.onUserInput(
                        this.refs.filterTextInput.value,
                        this.refs.inStockOnlyInput.checked
                );
            },
            render: function() {
                return (
                        <form>
                            <input
                                    type="text"
                                    placeholder="Search..."
                                    value={this.props.filterText}
                                    ref="filterTextInput"
                                    onChange={this.handleChange}
                            />
                            <p>
                                <input
                                        type="checkbox"
                                        checked={this.props.inStockOnly}
                                        ref="inStockOnlyInput"
                                        onChange={this.handleChange}
                                />
                                {' '}
                                Only show products in stock
                            </p>
                        </form>
                );
            }
        });

        var FilterableProductTable = React.createClass({
            getInitialState: function() {
                return {
                    filterText: '',
                    inStockOnly: false
                };
            },

            handleUserInput: function(filterText, inStockOnly) {
                this.setState({
                    filterText: filterText,
                    inStockOnly: inStockOnly
                });
            },

            render: function() {
                return (
                        <div>
                            <SearchBar
                                    filterText={this.state.filterText}
                                    inStockOnly={this.state.inStockOnly}
                                    onUserInput={this.handleUserInput}
                            />
                            <ProductTable
                                    products={this.props.products}
                                    filterText={this.state.filterText}
                                    inStockOnly={this.state.inStockOnly}
                            />
                        </div>
                );
            }
        });


        var PRODUCTS = [
            {category: 'Sporting Goods', price: '$49.99', stocked: true, name: 'Football'},
            {category: 'Sporting Goods', price: '$9.99', stocked: true, name: 'Baseball'},
            {category: 'Sporting Goods', price: '$29.99', stocked: false, name: 'Basketball'},
            {category: 'Electronics', price: '$99.99', stocked: true, name: 'iPod Touch'},
            {category: 'Electronics', price: '$399.99', stocked: false, name: 'iPhone 5'},
            {category: 'Electronics', price: '$199.99', stocked: true, name: 'Nexus 7'}
        ];

        ReactDOM.render(
                <FilterableProductTable products={PRODUCTS} />,
                document.getElementById('container')
        );

    </script>
</body>
</html>
