<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Itinerary</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value=" /resources/core/main.css" />" rel="stylesheet">
<script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
</head>
  
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
    }

    .page-heading {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }

    .form-section {
      margin-bottom: 20px;
    }

    .form-section label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .form-section input[type="text"],
    .form-section input[type="number"],
    .form-section textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      box-sizing: border-box;
    }

    .form-section textarea {
      resize: vertical;
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

    .button:hover {
      background-color: #28a745;
    }

    .day-container {
      margin-bottom: 20px;
      padding: 15px;
      background-color: #f9f9f9;
      border: 1px solid #ddd;
      border-radius: 4px;
    }

    .hidden {
      display: none;
    }

    /* Modal styles */
    .modal {
      display: none;
      /* Hidden by default */
      position: fixed;
      z-index: 1;
      /* Sit on top */
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
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
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
      max-width: 500px;
      border-radius: 8px;
    }

    .modal-close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .modal-close:hover,
    .modal-close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }

    .modal-body {
      text-align: center;
    }
  </style>
</head>

<body>

  <div style="display: flex; justify-content: space-between; width: 170px;">
    <button class="button" style="width: 80px;"><a href="./viewItinerary.html"
        style="color: white; text-decoration: none;">View</a></button>
    <button class="button" style="width: 80px;"><a href="./editItinerary.html"
        style="color: white; text-decoration: none;">Edit</a></button>
  </div>

  <br><br>
  <div id="form-container" class="container">
    <h1 class="page-heading" style="color: #28a745;">Create Itinerary</h1>

    <div id="initial-section" class="form-section" style="display: flex; justify-content: center;">
      <div>
        <label for="destination">Destination:</label>
        <input style="width: 300px; margin-right: 20px;" type="text" id="destination" name="destination" required
          oninput="updateButtonVisibility()">
      </div>
      <div>
        <label for="days">Days:</label>
        <input style="width: 300px;" type="number" id="days" name="days" min="1" max="20" required
          oninput="updateDayFields()">
      </div>
    </div>

    <div id="day-fields-container" class="hidden"></div>

    <div style="display: flex; justify-content: center;">
      <button style="width: 200px;" id="generate-button" class="button hidden"
        onclick="generateAndSubmit()">Generate</button>
      <button style="width: 200px; margin-left: 10px;" id="add-day-button" class="button hidden"
        onclick="promptAddNewDay()">Add New Day</button>
    </div>
  </div>

  <!-- Modal -->
  <div id="successModal" class="modal">
    <div class="modal-content">
      <span class="modal-close" onclick="closeModal()">&times;</span>
      <div class="modal-body">
        <h2>Itinerary Created Successfully</h2>
        <p>Your itinerary has been created successfully.</p>
      </div>
    </div>
  </div>

  <script>
    let previousValues = {};

    function updateDayFields() {
      let days = parseInt(document.getElementById('days').value) || 0;
      let dayFieldsContainer = document.getElementById('day-fields-container');

      // Save current values before updating
      saveCurrentValues();

      dayFieldsContainer.classList.remove('hidden');
      dayFieldsContainer.innerHTML = '';

      for (let i = 1; i <= days; i++) {
        let dayContainer = document.createElement('div');
        dayContainer.classList.add('day-container');
        dayContainer.id = `day-container-${i}`;
        dayContainer.innerHTML = `
          <h3>Day ${i}</h3>
          <div class="form-section">
            <label for="title${i}">Title for Day ${i}:</label>
            <input type="text" id="title${i}" name="title${i}" value="${previousValues[i]?.title || ''}" required>
          </div>
          <div class="form-section">
            <label for="activities${i}">Activities:</label>
            <textarea id="activities${i}" maxlength="10000" name="activities${i}" rows="4" required>${previousValues[i]?.activities || ''}</textarea>
          </div>
        `;
        dayFieldsContainer.appendChild(dayContainer);
      }

      updateButtonVisibility();
    }

    function saveCurrentValues() {
      let days = parseInt(document.getElementById('days').value) || 0;

      for (let i = 1; i <= days; i++) {
        let title = document.getElementById('title' + i)?.value || '';
        let activities = document.getElementById('activities' + i)?.value || '';

        previousValues[i] = { title, activities };
      }
    }

    function updateButtonVisibility() {
      let destination = document.getElementById('destination').value.trim();
      let days = parseInt(document.getElementById('days').value) || 0;
      let generateButton = document.getElementById('generate-button');
      let addDayButton = document.getElementById('add-day-button');

      // Show/hide generate button
      if (destination !== '' && days > 0) {
        generateButton.classList.remove('hidden');
      } else {
        generateButton.classList.add('hidden');
      }

      // Show/hide add day button
      if (destination !== '' && days > 0) {
        addDayButton.classList.remove('hidden');
      } else {
        addDayButton.classList.add('hidden');
      }
    }

    function generateAndSubmit() {
      let destination = document.getElementById('destination').value;
      let days = parseInt(document.getElementById('days').value) || 0;
      let details = [];

      for (let i = 1; i <= days; i++) {
        let title = document.getElementById('title' + i).value;
        let activities = document.getElementById('activities' + i).value;

        details.push({
          title: title,
          dayNumber: i,
          activity: activities
        });
      }

      let itinerary = {
        travelDestination: destination,
        createdAt: new Date().toISOString(),
        duration: days,
        leadId: 788,
        quotationId: 107,
        details: details
      };

      console.log(itinerary);

      fetch('http://localhost:8082/api/itineraries', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(itinerary),
      })
        .then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok');
          }
          return response.json();
        })
        .then(data => {
          console.log('Success:', data);
          showModal();
        })
        .catch(error => {
          console.error('Error:', error);
        });
    }

    function showModal() {
      document.getElementById('successModal').style.display = 'block';
    }

    function closeModal() {
      document.getElementById('successModal').style.display = 'none';
    }

    function promptAddNewDay() {
      let currentDays = parseInt(document.getElementById('days').value) || 0;
      let newDayNumber = parseInt(prompt('Enter the day number where you want to add a new day:'));

      if (isNaN(newDayNumber) || newDayNumber < 1 || newDayNumber > (currentDays + 1)) {
        alert('Invalid day number.');
        return;
      }

      saveCurrentValues();
      document.getElementById('days').value = currentDays + 1;
      updateDayFields();

      // Reinsert existing days data
      for (let i = 1; i <= currentDays; i++) {
        let title = previousValues[i]?.title || '';
        let activities = previousValues[i]?.activities || '';

        if (i >= newDayNumber) {
          document.getElementById('title' + (i + 1)).value = title;
          document.getElementById('activities' + (i + 1)).value = activities;
        } else {
          document.getElementById('title' + i).value = title;
          document.getElementById('activities' + i).value = activities;
        }
      }

      // Clear the new day's fields
      document.getElementById('title' + newDayNumber).value = '';
      document.getElementById('activities' + newDayNumber).value = '';
    }

    window.onclick = function (event) {
      if (event.target === document.getElementById('successModal')) {
        closeModal();
      }
    }
  </script>
</body>
</html>