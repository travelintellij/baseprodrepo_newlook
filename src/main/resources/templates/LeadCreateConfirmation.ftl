<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Page</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Poppins:wght@200&display=swap"
        rel="stylesheet">
</head>


<body
    style=" font-family: 'Poppins', sans-serif; margin: 0; padding: 0; background-image:
url('https://mcusercontent.com/b524536bce55ad238411aa638/images/7319b08d-4dee-0a6d-4a54-42e6639639a7.jpg');
background-repeat: no-repeat; background-size: cover; background-position: center;">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0"
                    style=" background: #ff4d6d; text-align: center;">
                    <tr>
                        <td style="padding:10px 0">
                            <img src="https://gallery.mailchimp.com/b524536bce55ad238411aa638/images/488c4b5b-8dae-4155-ac97-bd1c4c5349fa.jpg"
                                alt="" height="90" margin: 10px auto;">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!-- Main Content -->

    <main style="padding: 20px;">
        <div
            style="margin: 10px auto; max-width: 500px; text-align: center;background-color: #fff0f3e6;;color:black;border-radius: 5px;border:5px solid pink">
            <h1 style="font-size: 20px; margin-bottom: 20px;">Query Reference Number:
                ${leadConfirmationNumber}</h1>
        </div>
        <div style="background-color: #fff0f3e6; padding: 20px; border-radius: 10px;">
            <h1 style="font-weight: bold; font-size: 38px; color:black">Dear <span
                    style="color: #ff6700;">${contactName}</span></h1>
            <p style=" font-family: 'Poppins', sans-serif;color: black;">UdanChoo has created and registered a new
                query in our system. Your unique query reference number is <strong>${leadConfirmationNumber}</strong>
                related to this deal.</p>
            <table style="border-collapse: collapse; width: 90%;">
                <tr>
                    <th style="padding-right: 10px; color: black; text-align: left;">Guests</th>
                    <td style=" font-family: 'Poppins', sans-serif;color:black">${guestDetails}</td>
                </tr>
                <tr>
                    <th style="padding-right: 10px; color:black; text-align: left;">Travel Start Date</th>
                    <td style=" font-family: 'Poppins', sans-serif;color:black">${travelStartDate}</td>
                </tr>
                <tr>
                    <th style="padding-right: 10px; color:black; text-align: left;">Travel End Date</th>
                    <td style=" font-family: 'Poppins', sans-serif;color:black">${travelEndDate}</td>
                </tr>
                <tr>
                    <th style="padding-right: 10px; color: black; text-align: left;">Traveling From</th>
                    <td style=" font-family: 'Poppins', sans-serif;color:black">${sourceName}</td>
                </tr>
                <tr>
                    <th style="padding-right: 10px; color: black; text-align: left;">Traveling To</th>
                    <td style=" font-family: 'Poppins', sans-serif;color:black">${destinationName}</td>
                </tr>
            </table>
            <p style=" font-family: 'Poppins', sans-serif;font-weight:bold;color:black">Your Services
                Include:<br>${Services}</p>
            <p style="color:black">Remarks: <span style="font-family: 'Poppins', sans-serif;">${clientRemarks}</span>
            </p>
            <p style="color:black">Looking forward to seeing your pleasurable experience with us! You will hear soon
                from us with the quotation to proceed further.<br><br>I am <span
                    style="font-weight: bold;">${serviceAdvisor}</span> reachable at <strong>${contactNumber}</strong>,
                this information is if in case you would like to talk to us so that we clarify all your doubts related
                to costing and service inclusions & charges.<br><br>Please feel free to escalate to my manager by email
                <strong style="color:black">sales@udanchoo.com</strong> or call @ <strong>99 99 44 9267</strong>, if you find any issue
                related to my extended support in this query. I am dedicated and working on this query.
            </p>
            <p style="color:black">Regards <br><span style="font-weight: bold;">${serviceAdvisor}</span><br>Your Query
                Owner <br>Customer care: 99 99 44 6267</p>
        </div>
    </main>


    <!-- Rest of your content... -->

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0"
                    style="height: 70px; background: #ff4d6d;padding-top:5px">
                    <tr>
                        <td>
                            <div style="padding-top: 10px; padding-bottom: 2px; text-align: center;">
                                <a href="https://www.facebook.com/UdanChoo.travel"
                                    style="color: black; text-decoration: none; font-weight: bold;">| Facebook | </a>
                                <a href="https://instagram.com/udanchoo.travel?igshid=MzRlODBiNWFlZA=="
                                    style="  color: black; text-decoration: none; font-weight: bold;">Instagram |</a>
                                <a href="https://www.linkedin.com/company/90779253/admin/feed/posts/"
                                    style=" color: black; text-decoration: none; font-weight: bold;">LinkedIn |</a>
                            </div>
                            <div style="text-align: center; font-size: 12px; color: black;">
                                <p>Copyright © 2020 | UdanChoo.com | All rights reserved.</p>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>

</html>