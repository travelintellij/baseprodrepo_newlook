<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* General body styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Modal styles */
        .modal {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 1;
            /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black with opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #ddd;
            width: 80%;
            /* Could be more or less, depending on screen size */
            max-width: 400px;
            /* Limit max width */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            position: relative;
        }

        /* Close button */
        .close {
            color: #888;
            float: right;
            font-size: 24px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #333;
            text-decoration: none;
            cursor: pointer;
        }

        /* Button styles */
        .modal-button,
        .due_today_task_data_btns {
            background-color: #32cd32;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            margin: 5px;
        }

        .modal-button.delete {
            background-color: #f44336 !important
        }

        .modal-button.cancel {
            background-color: #32cd32;
        }

        /* Container for buttons in modal */
        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        /* Container for form */
        #form-container {
            margin: 60px auto;
            max-width: 1200px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        #popupContent {
            margin: 20px 0;
        }

        /* Links in buttons */
        a {
            /* color: white; */
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        ul {
            list-style: none;
            /* Remove default bullet points */
            padding: 0;
            /* Remove default padding */
        }

        li {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: start;
        }

        li:last-child {
            border-bottom: none;
            /* Remove border from the last item */
        }

        .day-number {
            font-weight: bold;
        }

        .title {
            font-style: italic;
            color: #555;
        }

        .activity {
            color: #666;
        }

        .button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #32cd32;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>

<body>

    <div style="display: flex;justify-content: space-between;width:170px;">
        <button class="button" style="width: 80px;"><a href="./createItinerary.html"
                style="color: white;text-decoration: none;">Create</a></button>
        <button class="button" style="width: 80px;"><a href="./editItinerary.html"
                style="color: white;text-decoration: none;">Edit</a></button>
    </div>

    <div id="form-container">
        <div id="popupContent">Loading content...</div>
        <div class="button-container">
            <button class="due_today_task_data_btns" style="background: #f44336;">Delete Itinerary</button>
            <button class="modal-button">
                <a style="color: white;" href="./editItinerary.html">Edit Itinerary</a>
            </button>
            <button class="modal-button">
                <a href="#" id="download-link">Download PDF</a>
            </button>
        </div>
    </div>

    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>Are you sure you want to delete this itinerary?</p>
            <div class="button-container">
                <button onclick="deleteItinerary()" id="confirmDeleteBtn" class="modal-button delete">Confirm
                    Delete</button>
                <button id="cancelDeleteBtn" class="modal-button cancel">Cancel</button>
            </div>
        </div>
    </div>

    <script>
        fetch('http://localhost:8082/api/itineraries/search/107', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log("Data:", data[0]);
                console.log("Data:", data[0]["leadId"]);

                var content = "<h1>Tentative Itinerary</h1>" +
                    "<div>" +
                    "<h3>Travel Destination: " + data[0].travelDestination + "</h3>" +
                    "<ul>";

                if (Array.isArray(data)) {
                    data[0].details.forEach(detail => {
                        content += "<li>" +
                            "<h3>Day " + (detail.dayNumber || 'N/A') + ":</h3> " +
                            "<strong>" + (detail.title || 'N/A') + "</strong><br>" +
                            (detail.activity || 'N/A') +
                            "</li>";
                    });
                } else {
                    content += "<li>No details available</li>";
                }

                content += "</ul></div>";

                document.getElementById('popupContent').innerHTML = content;
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('popupContent').innerHTML = 'No itinerary found.';
            });

        document.addEventListener('DOMContentLoaded', function () {
            function showModal() {
                var modal = document.getElementById('deleteModal');
                modal.style.display = 'block';
            }

            function hideModal() {
                var modal = document.getElementById('deleteModal');
                modal.style.display = 'none';
            }

            document.querySelector('.due_today_task_data_btns').addEventListener('click', function () {
                showModal();
            });

            var closeModalButtons = document.querySelectorAll('.modal .close');
            closeModalButtons.forEach(function (button) {
                button.addEventListener('click', function () {
                    hideModal();
                });
            });

            document.getElementById('cancelDeleteBtn').addEventListener('click', function () {
                hideModal();
            });

            document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
                deleteItinerary();
                hideModal();
            });
        });

        function deleteItinerary() {
            var quotation_id = 510; // Replace with actual quotation ID

            fetch('http://localhost:8082/api/itineraries/107', {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ quotation_id: quotation_id }),
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    console.log('Itinerary deleted successfully');
                    location.reload(); // Refresh the page
                })
                .catch(error => {
                    console.error('There was a problem deleting the itinerary:', error);
                });
        }

        document.getElementById('download-link').addEventListener('click', function (event) {
            event.preventDefault(); // Prevent the default link behavior
            downloadPDF();
        });

        function downloadPDF() {
            fetch('http://localhost:8082/api/pdf/pdf/107', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/pdf'
                }
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }

                    console.log(response)
                    return response
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });
        }
    </script>

</body>

</html>