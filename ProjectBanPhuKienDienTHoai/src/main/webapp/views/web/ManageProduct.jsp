<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="<c:url value='/views/css/css/manager.css' />" rel="stylesheet" />
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            <a href="phantrangmp" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listP}" var="p">
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                        <label for="checkbox1"></label>
                                    </span>
                                </td>
                                <td>${p.id}</td>
                                <td>${p.name}</td>
                                <td>
                                    <c:choose>
                					<c:when test="${fn:startsWith(p.image, 'http://') || fn:startsWith(p.image, 'https://')}">
                    					<img src="${p.image}" alt="${p.title}">
                					</c:when>
                					<c:otherwise>
                    					<img src="<%= request.getContextPath() %>/views/css/imageProduct/${p.image}" alt="${p.title}">
               						</c:otherwise>
            						</c:choose>
                                </td>
                                <td>${p.price} VNĐ</td>
                                <td>
							    <a data-target="#editEmployeeModal" 
							       href="#editEmployeeModal" 
							       class="edit" 
							       data-toggle="modal" 
							       data-id="${p.id}"
							       data-name="${p.name}"
							       data-image="${p.image}"
							       data-price="${p.price}"
							       data-title="${p.title}"
							       data-description="${p.description}"
							       data-category="${p.cateID.cateID}">
							        <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
							    </a>
							    <a href="deletep?pid=${p.id}" class="delete" data-toggle="modal">
							        <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
							    </a>
							</td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <ul class="pagination">
                    <li style="${tag == 1 ? 'pointer-events: none;':''}" 
                    class="${tag > 1  ? 'page-item active' : 'page-item'}">
                    <a href="manager?index=${tag-1}" class="page-link">Previous</a></li>
                    	<c:forEach begin="1" end="${endp}" var="i">
                    		<li class="${tag == i ? 'page-item active' : 'page-item'}">
                    			<a href="manager?index=${i}" class="page-link">${i}</a>
                    		</li>
                    	</c:forEach>
                    <li style="${tag == endp ? 'pointer-events: none;':''}" 
                    class="${tag < endp ? 'page-item active' : 'page-item'}">
                    <a href="manager?index=${tag+1}" class="page-link">Next</a>
                    </li>
                    </ul>
                </div>
            </div>
            <a href="home"><button type="button" class="btn btn-primary">Back to home</button></a>

        </div>
        <!-- Add Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addp" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
            					<label>Image</label>
            					<input name="image" type="file" class="form-control" required>
        					</div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea name="title" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="c">
                                        <option value="${c.cateID}">${c.cateName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Form -->
        <div id="editEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="update" method="post">
                <div class="modal-header">						
                    <h4 class="modal-title">Update Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <!-- Hidden input to store the ID -->
                    <div class="form-group">
                        <label>Product ID</label>
                        <input id="edit-id" name="eid" type="text" class="form-control" readonly required>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="hidden" id="edit-image-old" name="eimage-old">
                        <input id="edit-name" name="ename" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Current Image</label>
                        <img id="edit-image-preview" src="" alt="Product Image" style="width: 200px; height: 120px;">
                    </div>
                    <div class="form-group">
                        <label>New Image (optional)</label>
                        <input id="edit-image" name="eimage" type="file" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input id="edit-price" name="eprice" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Title</label>
                        <textarea id="edit-title" name="etitle" class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea id="edit-description" name="edescription" class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <select id="edit-category" name="ecategory" class="form-select" aria-label="Default select example">
                            <c:forEach items="${listC}" var="c">
                                <option value="${c.cateID}">${c.cateName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Update">
                </div>
            </form>
        </div>
    </div>
</div>
        
    <script href="<c:url value='/views/css/js/manager.js' />" type="text/javascript"></script>
    <script>
$(document).ready(function() {
    $('.edit').on('click', function() {
        // Get data from the clicked edit link
        var id = $(this).data('id');
        var name = $(this).data('name');
        var image = $(this).data('image');
        var price = $(this).data('price');
        var title = $(this).data('title');
        var description = $(this).data('description');
        var category = $(this).data('category');
        var a = "<%= request.getContextPath() %>/views/css/imageProduct/";
      	
        // Set values in the edit form
        $('#edit-id').val(id);
        $('#edit-name').val(name);
        // Update the image preview
        $('#edit-image-preview').attr('src',(image.startsWith('http://') || image.startsWith('https://')) ? 
			image : a+image);
        $('#edit-image-old').val(image);
        $('#edit-price').val(price);
        $('#edit-title').val(title);
        $('#edit-description').val(description);
        $('#edit-category').val(category);
        
        console.log(id);
        console.log(name);
        console.log(image);
        console.log(price);
        console.log(title);
        console.log(description);
    });
});
</script>

    
</body>
</html>