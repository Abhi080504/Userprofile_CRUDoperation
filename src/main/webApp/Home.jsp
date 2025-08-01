<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <div class="navbar-nav">
                <a href="register" class="btn btn-outline-primary me-2">Register</a>
                <a href="login" class="btn btn-outline-success">Login</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="text-center mb-4">Welcome to User Management System</h2>

        <!-- Currently logged in user details -->
        <c:if test="${userDetails != null}">
            <div class="row justify-content-center mb-4">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Logged In User Profile</h4>
                        </div>
                        <div class="card-body">
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">User ID:</div>
                                <div class="col-8">${userDetails.userid}</div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Name:</div>
                                <div class="col-8">${userDetails.name}</div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Username:</div>
                                <div class="col-8">${userDetails.username}</div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">Email:</div>
                                <div class="col-8">${userDetails.email}</div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4 fw-bold">City:</div>
                                <div class="col-8">${userDetails.city}</div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="row mt-4">
                                <div class="col-6">
                                    <form action="update" method="get">
                                        <input type="hidden" name="userid" value="${userDetails.userid}">
                                        <button type="submit" class="btn btn-warning w-100">Update Profile</button>
                                    </form>
                                </div>
                                <div class="col-6">
                                    <form action="delete" method="post" onsubmit="return confirm('Are you sure you want to delete your account?');">
                                        <input type="hidden" name="userid" value="${userDetails.userid}">
                                        <button type="submit" class="btn btn-danger w-100">Delete Account</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- All Users Table -->
        <div class="card mt-4">
            <div class="card-header bg-info text-white">
                <h4 class="mb-0">All Users</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>User ID</th>
                                <th>Name</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>City</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${allUsers}" var="user">
                                <tr>
                                    <td>${user.userid}</td>
                                    <td>${user.name}</td>
                                    <td>${user.username}</td>
                                    <td>${user.email}</td>
                                    <td>${user.city}</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <form action="update" method="get" class="me-2">
                                                <input type="hidden" name="userid" value="${user.userid}">
                                                <button type="submit" class="btn btn-warning btn-sm">Update</button>
                                            </form>
                                            <form action="delete" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                                                <input type="hidden" name="userid" value="${user.userid}">
                                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>