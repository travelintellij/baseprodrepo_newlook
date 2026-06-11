<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query Reference Confirmation</title>
    <style type="text/css">
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            background-color: #e0f2fe;
            margin: 0;
            padding: 0;
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
        }
        table {
            border-collapse: collapse;
            mso-table-lspace: 0pt;
            mso-table-rspace: 0pt;
        }
        img {
            border: 0;
            height: auto;
            line-height: 100%;
            outline: none;
            text-decoration: none;
        }
        .wrapper {
            width: 100%;
            table-layout: fixed;
            background-color: #e0f2fe;
            padding: 40px 0;
        }
        .container {
            max-width: 700px;
            margin: 0 auto;
            background-color: #f8fafc;
            border-radius: 12px;
            border: 2px solid #0369a1;
            overflow: hidden;
            box-shadow: 0 6px 18px rgba(3, 105, 161, 0.1);
        }
        .header {
            background-color: #f8fafc;
            padding: 30px;
            text-align: center;
        }
        .header img {
            max-width: 150px;
            display: inline-block;
        }
        .header h1 {
            display: inline-block;
            background-color: #e0f2fe;
            color: #0369a1;
            margin: 15px 0 0 0;
            padding: 8px 20px;
            border-radius: 6px;
            font-size: 22px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .content {
            padding: 40px 30px;
            color: #1e293b;
            font-size: 15px;
            line-height: 1.6;
        }
        .content h2 {
            font-size: 20px;
            color: #0369a1;
            margin-top: 0;
            margin-bottom: 20px;
            font-weight: 800;
            border-bottom: 2px solid #e0f2fe;
            padding-bottom: 10px;
        }
        .query-ref-box {
            background-color: #fffbeb;
            border-left: 4px solid #d97706;
            padding: 18px;
            margin-bottom: 25px;
            border-radius: 6px;
        }
        .query-ref-box p {
            margin: 0 0 5px 0;
            font-size: 13px;
            color: #b45309;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .query-ref-box span {
            font-size: 22px;
            color: #b45309;
            font-weight: 800;
        }
        .details-table {
            width: 100%;
            margin-bottom: 25px;
            border: 1px solid #bae6fd;
            border-radius: 8px;
            overflow: hidden;
            background-color: #ffffff;
        }
        .details-table td, .details-table th {
            padding: 12px 15px;
            font-size: 14px;
            border-bottom: 1px solid #e0f2fe;
        }
        .details-table tr:last-child td, .details-table tr:last-child th {
            border-bottom: none;
        }
        .details-table th {
            background-color: #f0f9ff;
            color: #0369a1;
            text-align: left;
            width: 35%;
            font-weight: bold;
        }
        .details-table td {
            color: #1e293b;
        }
        .services-section {
            background-color: #f0f9ff;
            border: 1px solid #bae6fd;
            border-radius: 8px;
            padding: 20px;
            margin: 25px 0;
        }
        .services-section h3 {
            margin-top: 0;
            margin-bottom: 12px;
            font-size: 15px;
            color: #0369a1;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #bae6fd;
            padding-bottom: 8px;
        }
        .services-list {
            margin: 0;
            padding: 0;
            list-style: none;
            color: #1e293b;
        }
        .footer {
            background-color: #f0f9ff;
            padding: 30px;
            text-align: center;
            border-top: 1px solid #bae6fd;
            color: #64748b;
            font-size: 12px;
        }
        .footer p {
            margin: 0 0 10px 0;
        }
        .footer a {
            color: #0369a1;
            text-decoration: none;
            font-weight: bold;
        }
        .footer .social-links {
            margin-top: 15px;
        }
        .footer .social-links a {
            margin: 0 10px;
        }
    </style>
</head>
<body>
    <center class="wrapper">
        <table class="container" width="100%" cellpadding="0" cellspacing="0">
            <!-- Header -->
            <tr>
                <td class="header">
                    <img src="https://gallery.mailchimp.com/b524536bce55ad238411aa638/images/488c4b5b-8dae-4155-ac97-bd1c4c5349fa.jpg" alt="UdanChoo Logo">
                    <h1>Query Confirmation</h1>
                </td>
            </tr>
            <!-- Content -->
            <tr>
                <td class="content">
                    <h2>Dear ${contactName},</h2>
                    <p>Thank you for choosing <strong>UdanChoo</strong>! We have registered a new query in our system based on your travel request.</p>
                    
                    <div class="query-ref-box">
                        <p>QUERY REFERENCE NUMBER</p>
                        <span>${leadConfirmationNumber}</span>
                    </div>

                    <table class="details-table" cellpadding="0" cellspacing="0">
                        <tr>
                            <th>Guests</th>
                            <td><strong>${guestDetails}</strong></td>
                        </tr>
                        <tr>
                            <th>Travel Start Date</th>
                            <td><strong>${travelStartDate}</strong></td>
                        </tr>
                        <tr>
                            <th>Travel End Date</th>
                            <td><strong>${travelEndDate}</strong></td>
                        </tr>
                        <tr>
                            <th>Traveling From</th>
                            <td><strong>${sourceName}</strong></td>
                        </tr>
                        <tr>
                            <th>Traveling To</th>
                            <td><strong>${destinationName}</strong></td>
                        </tr>
                    </table>

                    <div class="services-section">
                        <h3>Inclusions Requested</h3>
                        <div class="services-list">
                            <strong>${Services}</strong>
                        </div>
                    </div>

                    <p><strong>Remarks:</strong> <strong>${clientRemarks}</strong></p>

                    <p>We are working on creating a customized quotation to offer you the best options and pricing. You will receive the proposal from us shortly.</p>
                    
                    <p>I am your dedicated Query Owner, and I am here to assist with any questions:</p>
                    
                    <table width="100%" cellpadding="0" cellspacing="0" style="margin: 20px 0; background-color: #ffffff; border: 1px solid #bae6fd; border-radius: 8px; padding: 15px;">
                        <tr>
                            <td>
                                <strong style="color: #0369a1;">Service Advisor:</strong> <strong>${serviceAdvisor}</strong><br>
                                <strong style="color: #0369a1;">Contact:</strong> <strong>${contactNumber}</strong>
                            </td>
                        </tr>
                    </table>

                    <p style="font-size: 13px; color: #64748b; line-height: 1.5;">For escalations or further support, feel free to contact my manager at <a href="mailto:sales@udanchoo.com" style="color: #0369a1; text-decoration: none;"><strong>sales@udanchoo.com</strong></a> or call @ <strong>99 99 44 9267</strong>.</p>
                </td>
            </tr>
            <!-- Footer -->
            <tr>
                <td class="footer">
                    <p>Copyright &copy; 2026 UdanChoo.com. All rights reserved.</p>
                    <p>Our mailing address is: <a href="mailto:sales@udanchoo.com"><strong>sales@udanchoo.com</strong></a> | Customer Care: <strong>99 99 44 6267</strong></p>
                    <div class="social-links">
                        <a href="https://www.facebook.com/UdanChoo.travel"><strong>Facebook</strong></a>
                        <a href="https://instagram.com/udanchoo.travel?igshid=MzRlODBiNWFlZA=="><strong>Instagram</strong></a>
                        <a href="https://www.linkedin.com/company/90779253/admin/feed/posts/"><strong>LinkedIn</strong></a>
                    </div>
                </td>
            </tr>
        </table>
    </center>
</body>
</html>