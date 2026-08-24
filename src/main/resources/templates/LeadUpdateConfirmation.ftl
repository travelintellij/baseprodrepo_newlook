<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query Update Confirmation</title>
</head>
<body style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; background-color: #e0f2fe; margin: 0; padding: 0; -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; background-image: url('https://files.catbox.moe/h8pjky.png'); background-repeat: no-repeat; background-size: cover; background-position: top center;">
    <table width="100%" cellpadding="0" cellspacing="0" border="0" style="width: 100%; background-color: #e0f2fe; background-image: url('https://files.catbox.moe/h8pjky.png'); background-repeat: no-repeat; background-size: cover; background-position: top center;">
        <tr>
            <td align="center" style="background-image: url('https://files.catbox.moe/h8pjky.png'); background-repeat: no-repeat; background-size: cover; background-position: top center; padding: 40px 0;">
                <table width="100%" cellpadding="0" cellspacing="0" style="max-width: 700px; margin: 0 auto; background-color: #f8fafc; border-radius: 12px; border: 2px solid #0369a1; overflow: hidden; box-shadow: 0 6px 18px rgba(3, 105, 161, 0.1);">
            <!-- Header -->
            <tr>
                <td style="background-color: #f8fafc; padding: 30px; text-align: center;">
                    <img src="https://gallery.mailchimp.com/b524536bce55ad238411aa638/images/488c4b5b-8dae-4155-ac97-bd1c4c5349fa.jpg" alt="UdanChoo Logo" style="max-width: 150px; display: inline-block; border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;">
                    <br/>
                    <h1 style="display: inline-block; background-color: #e0f2fe; color: #0369a1; margin: 15px 0 0 0; padding: 8px 20px; border-radius: 6px; font-size: 22px; font-weight: 800; text-transform: uppercase; letter-spacing: 0.5px;">Query Updated</h1>
                </td>
            </tr>
            <!-- Content -->
            <tr>
                <td style="padding: 40px 30px; color: #1e293b; font-size: 15px; line-height: 1.6; text-align: left;">
                    <h2 style="font-size: 20px; color: #0369a1; margin-top: 0; margin-bottom: 20px; font-weight: 800; border-bottom: 2px solid #e0f2fe; padding-bottom: 10px;">Dear ${contactName},</h2>
                    <p style="margin: 0 0 16px 0;">Thank you for choosing <strong>UdanChoo</strong>! We have updated your query reference details in our system as per the latest requirements.</p>
                    
                    <div style="background-color: #fffbeb; border-left: 4px solid #d97706; padding: 18px; margin-bottom: 25px; border-radius: 6px;">
                        <p style="margin: 0 0 5px 0; font-size: 13px; color: #b45309; font-weight: bold; text-transform: uppercase; letter-spacing: 0.5px;">QUERY REFERENCE NUMBER</p>
                        <span style="font-size: 22px; color: #b45309; font-weight: 800;">${leadConfirmationNumber}</span>
                    </div>

                    <table width="100%" cellpadding="0" cellspacing="0" style="width: 100%; margin-bottom: 25px; border: 1px solid #bae6fd; border-radius: 8px; overflow: hidden; background-color: #ffffff; border-collapse: collapse;">
                        <tr>
                            <th style="padding: 12px 15px; font-size: 14px; border-bottom: 1px solid #e0f2fe; background-color: #f0f9ff; color: #0369a1; text-align: left; width: 35%; font-weight: bold;">Guests</th>
                            <td style="padding: 12px 15px; font-size: 14px; border-bottom: 1px solid #e0f2fe; color: #1e293b; text-align: left;"><strong>${guestDetails}</strong></td>
                        </tr>
                        <tr>
                            <th style="padding: 12px 15px; font-size: 14px; border-bottom: 1px solid #e0f2fe; background-color: #f0f9ff; color: #0369a1; text-align: left; width: 35%; font-weight: bold;">Travel Start Date</th>
                            <td style="padding: 12px 15px; font-size: 14px; border-bottom: 1px solid #e0f2fe; color: #1e293b; text-align: left;"><strong>${travelStartDate}</strong></td>
                        </tr>
                        <tr>
                            <th style="padding: 12px 15px; font-size: 14px; border-bottom: 1px solid #e0f2fe; background-color: #f0f9ff; color: #0369a1; text-align: left; width: 35%; font-weight: bold;">Travel End Date</th>
                            <td style="padding: 12px 15px; font-size: 14px; border-bottom: 1px solid #e0f2fe; color: #1e293b; text-align: left;"><strong>${travelEndDate}</strong></td>
                        </tr>
                        <tr>
                            <th style="padding: 12px 15px; font-size: 14px; border-bottom: 1px solid #e0f2fe; background-color: #f0f9ff; color: #0369a1; text-align: left; width: 35%; font-weight: bold;">Traveling From</th>
                            <td style="padding: 12px 15px; font-size: 14px; border-bottom: 1px solid #e0f2fe; color: #1e293b; text-align: left;"><strong>${sourceName}</strong></td>
                        </tr>
                        <tr>
                            <th style="padding: 12px 15px; font-size: 14px; border-bottom: none; background-color: #f0f9ff; color: #0369a1; text-align: left; width: 35%; font-weight: bold;">Traveling To</th>
                            <td style="padding: 12px 15px; font-size: 14px; border-bottom: none; color: #1e293b; text-align: left;"><strong>${destinationName}</strong></td>
                        </tr>
                    </table>

                    <div style="background-color: #f0f9ff; border: 1px solid #bae6fd; border-radius: 8px; padding: 20px; margin: 25px 0;">
                        <h3 style="margin-top: 0; margin-bottom: 12px; font-size: 15px; color: #0369a1; font-weight: 800; text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid #bae6fd; padding-bottom: 8px; text-align: left;">Inclusions Requested</h3>
                        <div style="margin: 0; padding: 0; list-style: none; color: #1e293b; text-align: left;">
                            <strong>${Services}</strong>
                        </div>
                    </div>

                    <p style="margin: 0 0 16px 0;"><strong>Remarks:</strong> <strong>${clientRemarks}</strong></p>

                    <p style="margin: 0 0 16px 0;">We are dedicated to giving you a pleasurable travel experience! Our team is updating your proposal to offer you the best options and pricing. You will hear from us shortly.</p>
                    
                    <p style="margin: 0 0 16px 0;">I am your dedicated Query Owner, and I am here to assist with any questions:</p>
                    
                    <table width="100%" cellpadding="0" cellspacing="0" style="margin: 20px 0; background-color: #ffffff; border: 1px solid #bae6fd; border-radius: 8px; padding: 15px; border-collapse: collapse;">
                        <tr>
                            <td style="color: #1e293b; font-size: 15px; line-height: 1.6; text-align: left;">
                                <strong style="color: #0369a1;">Service Advisor:</strong> <strong>${serviceAdvisor}</strong><br>
                                <strong style="color: #0369a1;">Contact:</strong> <strong>${contactNumber}</strong>
                            </td>
                        </tr>
                    </table>

                    <div style="text-align: center; margin: 25px 0;">
                        <a href="https://wa.me/919999446267" style="display: inline-block; background-color: #25D366; color: #ffffff; padding: 12px 30px; font-size: 16px; font-weight: bold; text-decoration: none; border-radius: 30px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); letter-spacing: 0.5px;">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/120px-WhatsApp.svg.png" style="vertical-align: middle; width: 20px; height: 20px; margin-right: 8px; border: 0;" alt="WhatsApp" /> Chat on WhatsApp
                        </a>
                    </div>

                    <p style="font-size: 13px; color: #64748b; line-height: 1.5; margin: 0 0 16px 0;">For escalations or further support, feel free to contact my manager at <a href="mailto:sales@udanchoo.com" style="color: #0369a1; text-decoration: none; font-weight: bold;"><strong>sales@udanchoo.com</strong></a> or call @ <strong>99 99 44 9267</strong>.</p>
                </td>
            </tr>
            <!-- Footer -->
            <tr>
                <td style="background-color: #f0f9ff; padding: 30px; text-align: center; border-top: 1px solid #bae6fd; color: #64748b; font-size: 12px; line-height: 1.6;">
                    <p style="margin: 0 0 10px 0;">Copyright &copy; 2026 UdanChoo.com. All rights reserved.</p>
                    <p style="margin: 0 0 10px 0;">Our mailing address is: <a href="mailto:sales@udanchoo.com" style="color: #0369a1; text-decoration: none; font-weight: bold;"><strong>sales@udanchoo.com</strong></a> | Customer Care: <strong>99 99 44 6267</strong></p>
                    
                    <div style="background-color: #ffffff; border: 1px solid #bae6fd; border-radius: 8px; padding: 15px; margin-top: 20px; text-align: center; box-shadow: 0 2px 4px rgba(3,105,161,0.05);">
                        <p style="margin: 0 0 10px 0; font-size: 11px; color: #0369a1; font-weight: bold; text-transform: uppercase; letter-spacing: 0.5px;">Connect With Us</p>
                        <div style="display: inline-block;">
                            <a href="https://www.facebook.com/UdanChoo.travel" style="display: inline-block; background-color: #1877f2; color: #ffffff; padding: 6px 15px; font-size: 11px; font-weight: bold; text-decoration: none; border-radius: 4px; margin: 5px;"><strong>Facebook</strong></a>
                            <a href="https://instagram.com/udanchoo.travel?igshid=MzRlODBiNWFlZA==" style="display: inline-block; background-color: #e1306c; color: #ffffff; padding: 6px 15px; font-size: 11px; font-weight: bold; text-decoration: none; border-radius: 4px; margin: 5px;"><strong>Instagram</strong></a>
                            <a href="https://www.linkedin.com/company/90779253/admin/feed/posts/" style="display: inline-block; background-color: #0a66c2; color: #ffffff; padding: 6px 15px; font-size: 11px; font-weight: bold; text-decoration: none; border-radius: 4px; margin: 5px;"><strong>LinkedIn</strong></a>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
            </td>
        </tr>
    </table>
</body>
</html>
