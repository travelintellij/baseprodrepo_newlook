<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;

        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            text-align: center;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .error-image {
            display: block;
            margin: 0 auto;
            width: 300px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 28px;
            margin-top: 20px;
            color: #333;
        }

        p {
            font-size: 18px;
            color: #666;
            margin-top: 10px;
            line-height: 1.5;
        }

        .btn-container {
            margin-top: 30px;
        }

        .error-btn {
            display: inline-block;
            padding: 12px 24px;
            background-color: #f8af51; /* Adjusted to match the provided color */
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 18px;
            margin-right: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
            border: none;
            outline: none;
        }

        .error-btn:hover {
            background-color: #d08934; /* Darker shade for hover effect */
        }

        .error-btn:last-child {
            margin-right: 0;
        }

        .error-btn:focus {
            box-shadow: 0 0 0 2px #f8af51; /* Adjusted to match the provided color */
        }
    </style>
</head>
<body>
<div class="container">
    <img class="error-image" src="https://i.ibb.co/W6tgcKQ/softcodeon.png" alt="Error Illustration">
    <h1>Oops! We couldn't find that page.</h1>
    <p>The page you are looking for might have been removed, or is temporarily unavailable.</p>
    <div class="btn-container">
        <a class="error-btn" href="${pageContext.request.contextPath}/AdminHome">Go to Homepage</a>
        <button class="error-btn" onclick="window.history.back()">Go Back</button>

    </div>
</div>
</body>
</html>
