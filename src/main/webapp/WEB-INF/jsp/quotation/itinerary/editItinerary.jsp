<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Itinerary</title>
    <style>
        /* General body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        /* Wrapper styling */
        .wrapper {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }

        /* Heading style */
        h2 {
            color: #32cd32;
            text-align: center;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        /* Input group styles */
        .input-group {
            margin-bottom: 15px;
        }

        /* Label styling */
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        /* Input field styles */
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Textarea styling */
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            min-height: 50px;
        }

        /* Button styling */
        button {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            background: #32cd32;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        /* Button hover effect */
        button:hover {
            background-color: #28a745;
        }

        /* Center button container */
        #details-container {
            margin-top: 20px;
        }

        /* Delete button styling */
        .delete-btn {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            background: #ff4d4d;
            color: white;
            cursor: pointer;
            font-size: 0.9rem;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .delete-btn:hover {
            background-color: #e60000;
        }

        /* Add day button styling */
        .add-day-btn {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            background: #007bff;
            color: white;
            cursor: pointer;
            font-size: 0.9rem;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .add-day-btn:hover {
            background-color: #0056b3;
        }

        /* Modal styling */
        .modal {
            display: none;
            /* Hidden by default */
            position: fixed;
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
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            /* Could be more or less, depending on screen size */
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <div style="display: flex;justify-content: space-between;width:170px;">
    
    
        <button class="button" style="width: 80px;"><a href="./createItinerary.html"
                style="color: white;text-decoration: none;">Create</a></button>
        <button class="button" style="width: 80px;"><a href="./viewItinerary.html"
                style="color: white;text-decoration: none;">View </a></button>
    
    </div>

<br>


    <div class="wrapper">
        <h2>Edit Itinerary</h2>

        <div style="display: flex; justify-content: center;">
            <div>
                <div class="input-group">
                    <label for="destination">Destination:</label>
                    <input type="text" id="destination" style="width: 300px; margin-right: 20px;">
                </div>
            </div>
            <div>
                <div class="input-group">
                    <label for="duration">Duration:</label>
                    <input type="number" id="duration" min="1" style="width: 300px;">
                </div>
            </div>
        </div>

        <div id="details-container"></div>
        <div style="display: flex; justify-content: center; margin-top: 20px;">
            <button id="generate-btn" onclick="updateItinerary()" style="margin-right: 10px;">Update Itinerary</button>
            <button id="add-day-btn" onclick="showAddDayPrompt()">Add New Day</button>
        </div>
    </div>

    <!-- Success Modal -->
    <div id="successModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>Itinerary successfully updated!</p>
        </div>
    </div>

    <!-- Error Modal -->
    <div id="errorModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p>No itinerary found to update!</p>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', async function () {
            try {
                // Fetch itinerary data from the server
                const response = await fetch('http://localhost:8082/api/itineraries/search/107', {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                });

                if (!response.ok) {
                    throw new Error('Failed to fetch itinerary data');
                }

                const data = await response.json();
                console.log('Fetched data:', data);

                if (Array.isArray(data) && data.length > 0) {
                    const itinerary = data[0];

                    // Populate destination and duration fields
                    document.getElementById('destination').value = itinerary.travelDestination;
                    document.getElementById('duration').value = itinerary.duration;

                    // Populate details fields
                    const detailsContainer = document.getElementById('details-container');
                    updateDetailsFields(detailsContainer, itinerary.details, itinerary.duration);

                    // Add event listener to duration input
                    document.getElementById('duration').addEventListener('input', function () {
                        updateDetailsFields(detailsContainer, itinerary.details, this.value);
                    });
                } else {
                    console.error('Unexpected data format:', data);
                }
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        });

        function updateDetailsFields(container, detailsData, duration) {
            // Clear existing details fields
            container.innerHTML = '';

            // Ensure duration is a number
            duration = parseInt(duration) || 0;

            if (detailsData && duration > 0) {
                for (let i = 1; i <= duration; i++) {
                    const matchingDetail = detailsData.find(detail => detail.dayNumber === i) || {};
                    const detailDiv = document.createElement('div');

                    const titleLabel = document.createElement('label');
                    titleLabel.textContent = 'Title for Day ' + i + ':';
                    detailDiv.appendChild(titleLabel);

                    const titleInput = document.createElement('input');
                    titleInput.type = 'text';
                    titleInput.value = matchingDetail.title || '';
                    titleInput.id = 'day' + i + 'Title';
                    titleInput.name = 'day' + i + 'Title';
                    detailDiv.appendChild(titleInput);

                    const activityLabel = document.createElement('label');
                    activityLabel.textContent = 'Activity for Day ' + i + ':';
                    detailDiv.appendChild(activityLabel);

                    const activityInput = document.createElement('textarea');
                    activityInput.value = matchingDetail.activity || '';
                    activityInput.id = 'activity' + i;
                    activityInput.name = 'activity' + i;
                    detailDiv.appendChild(activityInput);

                    const deleteButton = document.createElement('button');
                    deleteButton.textContent = 'Delete Day ' + i;
                    deleteButton.classList.add('delete-btn');
                    deleteButton.onclick = () => deleteDetail(i);
                    detailDiv.appendChild(deleteButton);

                    container.appendChild(detailDiv);
                }
            } else {
                console.log('No details found or invalid duration.');
            }
        }

        function deleteDetail(dayNumber) {
            const duration = parseInt(document.getElementById('duration').value);

            // Fetch current details from the UI
            const detailsContainer = document.getElementById('details-container');
            let detailsData = [];

            for (let i = 1; i <= duration; i++) {
                const titleInput = document.querySelector(`input[name="day${i}Title"]`);
                const activityTextarea = document.querySelector(`textarea[name="activity${i}"]`);

                if (titleInput && activityTextarea) {
                    const dayTitle = titleInput.value;
                    const activity = activityTextarea.value;

                    detailsData.push({
                        dayNumber: i,
                        title: dayTitle,
                        activity: activity
                    });
                }
            }

            // Remove the detail with the specified dayNumber and renumber the remaining days
            detailsData = detailsData.filter(detail => detail.dayNumber !== dayNumber);
            detailsData = detailsData.map((detail, index) => ({
                ...detail,
                dayNumber: index + 1
            }));

            // Update the detailsContainer with the new details data
            const newDuration = detailsData.length;
            document.getElementById('duration').value = newDuration;
            updateDetailsFields(detailsContainer, detailsData, newDuration);
        }

        function addNewDay(dayNumber) {
            const durationInput = document.getElementById('duration');
            let currentDuration = parseInt(durationInput.value);

            if (isNaN(currentDuration) || currentDuration < 1) {
                alert('Please enter a valid duration.');
                return;
            }

            currentDuration += 1; // Increase duration by 1
            durationInput.value = currentDuration;

            // Fetch existing details data from the UI
            const detailsContainer = document.getElementById('details-container');
            const detailsData = [];

            for (let i = 1; i <= currentDuration - 1; i++) {
                const titleInput = document.querySelector(`input[name="day${i}Title"]`);
                const activityTextarea = document.querySelector(`textarea[name="activity${i}"]`);

                if (titleInput && activityTextarea) {
                    detailsData.push({
                        dayNumber: i,
                        title: titleInput.value,
                        activity: activityTextarea.value
                    });
                }
            }

            // Add a new empty detail object for the new day
            detailsData.splice(dayNumber - 1, 0, {
                dayNumber: dayNumber,
                title: '',
                activity: ''
            });

            // Renumber subsequent days
            for (let i = dayNumber; i < detailsData.length; i++) {
                detailsData[i].dayNumber = i + 1;
            }

            // Update the details fields
            updateDetailsFields(detailsContainer, detailsData, currentDuration);
        }

        function showAddDayPrompt() {
            const dayNumber = prompt('Enter the day number to add a new day after:');
            if (dayNumber && !isNaN(dayNumber) && dayNumber >= 1) {
                addNewDay(parseInt(dayNumber));
            } else {
                alert('Please enter a valid day number.');
            }
        }

        async function updateItinerary() {
            try {
                const destination = document.getElementById('destination').value;
                const totalDays = parseInt(document.getElementById('duration').value);
                const itinerary = [];

                for (let i = 1; i <= totalDays; i++) {
                    const dayTitleInput = document.querySelector(`input[name="day${i}Title"]`);
                    const activityInput = document.querySelector(`textarea[name="activity${i}"]`);

                    if (dayTitleInput && activityInput) {
                        const dayTitle = dayTitleInput.value;
                        const activity = activityInput.value;
                        itinerary.push({
                            title: dayTitle,
                            dayNumber: i,
                            activity: activity
                        });
                    } else {
                        console.error('Input elements for day ' + i + ' not found.');
                    }
                }

                if (itinerary.length === 0) {
                    // Show error modal if no itinerary details are found
                    showModal('errorModal');
                    return;
                }

                const requestData = {
                    travelDestination: destination,
                    createdAt: new Date().toISOString(),
                    duration: totalDays,
                    leadId: 0, // Adjust this value as needed
                    quotationId: 107, // Adjust this value as needed
                    details: itinerary
                };

                console.log('Request Data:', requestData);

                const updateResponse = await fetch('http://localhost:8082/api/itineraries', {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(requestData)
                });

                if (!updateResponse.ok) {
                    throw new Error('Failed to update itinerary');
                }

                console.log('Itinerary updated successfully!');
                showModal('successModal'); // Show the success modal upon successful update
            } catch (error) {
                console.error('Error updating itinerary:', error);
                showModal('errorModal'); // Show error modal on catch
            }
        }

        // Function to show the modal
        function showModal(modalId) {
            const modal = document.getElementById(modalId);
            const span = modal.querySelector('.close');

            modal.style.display = 'block';

            span.onclick = function () {
                modal.style.display = 'none';
            }

            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = 'none';
                }
            }
        }
    </script>
</body>

</html>