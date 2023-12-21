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


<body style=" font-family: 'Poppins', sans-serif; margin: 0; padding: 0; background-image:
url('https://mcusercontent.com/b524536bce55ad238411aa638/images/7319b08d-4dee-0a6d-4a54-42e6639639a7.jpg');
background-repeat: no-repeat; background-size: cover; background-position: center;">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0"
                    style=" background: #023e8a; text-align: center;">
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
            style="margin: 10px auto; max-width: 500px; text-align: center;background-color: #fff0f3e6;color:black;border-radius: 5px;border:5px solid rgba(0, 0, 255, 0.488)">
            <h1 style="font-size: 20px; margin-bottom: 20px;">B2B Query Ref Number:
                ${leadConfirmationNumber}</h1>
        </div>
        <div style="background-color: #fff0f3e6; padding: 20px; border-radius: 10px;">
            <h1 style="font-weight: bold; font-size: 38px; color:black">Dear B2b Partner</h1>
            <p style=" font-family: 'Poppins', sans-serif;color: black;">UdanChoo has created and registered a new query
                in our system. You are receiving this email because UdanChoo believes that you will provide us with the
                best possible cost and service.</p>
            <table style="border-collapse: collapse; width: 90%;">
             <tr>
             <td>
                <pre>${queryMessage}</pre>
                </td>
                </tr>
            </table>
            <p style="color:black">Looking forward to seeing our better partnering experience
                You will hear soon from us with the confimation to proceed further once we find your deal better and
                competitive and
                also we secure a confirmation from our client
            </p>
            <p style="color:black">I am <b> ${serviceAdvisor} </b> reachable at ${contactNumber} , this information is
                if in case you would like to talk to us &nbsp;
            </p>
            <p style="color:black">Please feel free to escalate to my manager by email
                <strong>sales@udanchoo.com</strong> or call <strong>99 99 44 9267</strong> @, if you find any issue
                related to my extended support in this query. I am dedicated and working on this query. </p>
            <p style="color:black">Regards <br><span style="font-weight: bold;">${serviceAdvisor}</span><br>UdanChoo
                Query Owner <br>Customer care: 99 99 44 6267</p>
        </div>
    </main>


    <!-- Rest of your content... -->

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0"
                    style="height: 70px; background: #023e8a;padding-top:5px">
                    <tr>
                        <td>
                            <div style="padding-top: 10px; padding-bottom: 2px; text-align: center;">
                                <a href="https://www.facebook.com/UdanChoo.travel"
                                    style="color: white; text-decoration: none; font-weight: bold;">| Facebook | </a>
                                <a href="https://instagram.com/udanchoo.travel?igshid=MzRlODBiNWFlZA=="
                                    style="  color: white; text-decoration: none; font-weight: bold;">Instagram |</a>
                                <a href="https://www.linkedin.com/company/90779253/admin/feed/posts/"
                                    style=" color: white; text-decoration: none; font-weight: bold;">LinkedIn |</a>
                            </div>
                            <div style="text-align: center; font-size: 12px; color: white;">
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