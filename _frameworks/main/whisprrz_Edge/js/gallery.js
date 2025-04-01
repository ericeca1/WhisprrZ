/**
 * Looking Glass Gallery JavaScript
 * Handles gallery display, tab navigation, modals and user preferences for the Looking Glass feature
 */

$(document).ready(function() {
    console.log("Gallery.js initialized");
    initializeGallery();
    
    // Initialize Looking Glass search functionality
    initLookingGlassSearch();
    
    // Function to initialize Looking Glass search
    function initLookingGlassSearch() {
        // Open the Looking Glass search modal when search icon is clicked
        $('.icon_setting_gear, .search-icon').click(function(e) {
            e.preventDefault();
            $('#lookingGlassSearchModal').modal('show');
        });
        
        // Handle search button click
        $('#searchButton').click(function() {
            performSearch();
        });
        
        // Allow search on pressing Enter in the search field
        $('#searchQuery').keypress(function(e) {
            if (e.which === 13) {
                e.preventDefault();
                performSearch();
            }
        });
    }
    
    // Function to perform search based on form inputs
    function performSearch() {
        // Get search parameters
        var query = $('#searchQuery').val();
        var selectedCategories = [];
        
        // Collect all checked categories
        $('input[name="category"]:checked').each(function() {
            selectedCategories.push($(this).val());
        });
        
        // Get advanced search parameters
        var minAge = $('#minAge').val();
        var maxAge = $('#maxAge').val();
        var location = $('#location').val();
        var distance = $('#distance').val();
        
        // Create search parameters object
        var searchParams = {
            query: query,
            categories: selectedCategories,
            minAge: minAge,
            maxAge: maxAge,
            location: location,
            distance: distance
        };
        
        // Log search parameters (for development)
        console.log('Search Parameters:', searchParams);
        
        // Close the modal
        $('#lookingGlassSearchModal').modal('hide');
        
        // Here you would typically send these parameters to the server
        // and redirect to a search results page
        // For now, we'll just redirect with query parameters
        var queryString = '?query=' + encodeURIComponent(query);
        
        if (selectedCategories.length > 0) {
            queryString += '&categories=' + encodeURIComponent(selectedCategories.join(','));
        }
        
        if (minAge) queryString += '&minAge=' + encodeURIComponent(minAge);
        if (maxAge) queryString += '&maxAge=' + encodeURIComponent(maxAge);
        if (location) queryString += '&location=' + encodeURIComponent(location);
        if (distance) queryString += '&distance=' + encodeURIComponent(distance);
        
        // Redirect to search results
        window.location.href = 'looking_glass_results.php' + queryString;
    }
});

/**
 * Initialize the gallery functionality
 */
function initializeGallery() {
    // Set up tab navigation
    setupTabNavigation();
    
    // Set up modal functionality
    setupModals();
    
    // Configure gallery display
    enhanceGalleryDisplay();
    
    // Check for direct access
    checkDirectAccess();
    
    // Initialize location dropdowns
    initLocationDropdowns();
    
    // Initialize autocomplete functionality
    setupSearchAutocomplete();
}

/**
 * Set up tab navigation between different content sections
 */
function setupTabNavigation() {
    // Handle tab clicks
    $('.tabbable-line .nav-tabs li a').on('click', function(e) {
        if (!$(this).attr('data-toggle')) {
            e.preventDefault();
            var tabName = $(this).attr('onclick') ? 
                $(this).attr('onclick').match(/loadTab\('([^']+)'/)[1] : 
                $(this).parent().attr('class').replace('-tab', '');
            
            loadTab(tabName);
        }
    });
    
    // Set active tab based on URL
    const currentUrl = window.location.href;
    setActiveTabFromUrl(currentUrl);
}

/**
 * Load content for the specified tab
 * @param {string} tabName - Name of the tab to load
 * @param {string} url - URL to navigate to (optional)
 */
function loadTab(tabName, url) {
    console.log('Loading tab:', tabName, 'URL:', url);
    
    // Remove active class from all tabs
    $('.tabbable-line .nav-tabs li').removeClass('active');
    
    // Add active class to clicked tab
    $('.' + tabName + '-tab').addClass('active');
    
    // If URL is provided, navigate to it
    if (url) {
        window.location.href = url;
    } else {
        // Load tab content via AJAX if needed
        loadTabContent(tabName);
    }
}

/**
 * Load tab content via AJAX
 * @param {string} tabName - Name of the tab to load content for
 */
function loadTabContent(tabName) {
    // Implement AJAX content loading if needed
    console.log('Loading content for tab:', tabName);
    
    // Example AJAX loading (implement as needed)
    /*
    $.ajax({
        url: 'tab_content.php',
        data: { tab: tabName },
        success: function(response) {
            $('.gallery-container').html(response);
            enhanceGalleryDisplay();
        }
    });
    */
}

/**
 * Set the active tab based on the current URL
 * @param {string} url - Current URL
 */
function setActiveTabFromUrl(url) {
    const tabMap = {
        'photos': 'photos-tab',
        'friends': 'friends-tab',
        'online': 'online-tab',
        'matches': 'matches-tab',
        'nearby': 'nearby-tab',
        'live': 'live-tab'
    };
    
    let activeTabSet = false;
    
    // Check if any tab matches the current URL
    for (const [key, value] of Object.entries(tabMap)) {
        if (url.includes(`offset=${key}`)) {
            $('.' + value).addClass('active');
            activeTabSet = true;
            break;
        }
    }
    
    // If no offset in URL, activate the photos tab by default
    if (!activeTabSet && !url.includes('offset=')) {
        $('.photos-tab').addClass('active');
    }
}

/**
 * Set up modal functionality (gear and search modals)
 */
function setupModals() {
    // Gear modal handlers
    $('.icon_setting_gear').on('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        openGearModal();
    });
    
    $(document).on('click', '#closeGearModalBtn, #closeGearModalBtn2', function() {
        closeGearModal();
    });
    
    $(document).on('click', '#gear-settings-submit', function() {
        saveSettings();
    });
    
    $('#gearModal').on('click', function(event) {
        if ($(event.target).closest('.modal-content').length === 0) {
            closeGearModal();
        }
    });
    
    // Search modal handlers
    $('a[data-toggle="modal"][data-target="#lookingGlassSearchModal"]').on('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        showSearchModal();
    });
    
    $(document).on('click', '#lookingGlassModalClose, #lookingGlassModalClose2', function(e) {
        e.preventDefault();
        hideSearchModal();
    });
    
    $(document).on('click', '#looking-glass-search-submit', function() {
        $('#looking-glass-search-form').submit();
        hideSearchModal();
    });
    
    $('#lookingGlassSearchModal').on('click', function(event) {
        if ($(event.target).closest('.modal-content').length === 0) {
            hideSearchModal();
        }
    });
    
    // Tab navigation for gear modal
    $(document).on('click', '#settingsTabs a', function(e) {
        e.preventDefault();
        $(this).tab('show');
    });
}

/**
 * Open the gear modal and ensure it is centered
 */
function openGearModal() {
    const modal = document.getElementById('gearModal');
    if (modal) {
        // Ensure scroll position is at the top before showing modal
        window.scrollTo(0, 0);
        
        // Show the modal
        modal.style.display = 'block';
        
        // Position the modal near the top of the viewport
        const modalContent = modal.querySelector('.modal-content');
        if (modalContent) {
            modalContent.style.margin = '5% auto';
        }
        
        // Prevent background scrolling
        document.body.style.overflow = 'hidden';
        
        // Load user preferences
        if (typeof loadUserPreferences === 'function') {
            loadUserPreferences();
        }
    }
}

/**
 * Close the gear modal
 */
function closeGearModal() {
    const modal = document.getElementById('gearModal');
    if (modal) {
        modal.style.display = 'none';
        document.body.style.overflow = ''; // Restore background scrolling
    }
}

/**
 * Show search modal and load content
 */
function showSearchModal() {
    const modal = document.getElementById('lookingGlassSearchModal');
    if (modal) {
        modal.style.display = 'block';
        centerModal('lookingGlassSearchModal');
    }
}

/**
 * Hide search modal
 */
function hideSearchModal() {
    closeModal('lookingGlassSearchModal');
}

/**
 * Generic function to open a modal
 * @param {string} modalId - ID of the modal to open
 * @param {Function} loadFn - Function to load content (optional)
 */
function openModal(modalId, loadFn) {
    console.log('Opening modal:', modalId);
    document.getElementById(modalId).style.display = 'block';
    document.body.style.overflow = 'hidden'; // Prevent background scrolling
    
    if (loadFn) {
        loadFn();
    }
}

/**
 * Generic function to close a modal
 * @param {string} modalId - ID of the modal to close
 */
function closeModal(modalId) {
    console.log('Closing modal:', modalId);
    document.getElementById(modalId).style.display = 'none';
    document.body.style.overflow = ''; // Restore scrolling
}

/**
 * Load content for the gear modal
 */
function loadGearContent() {
    fetch('/include_gear_modal.php')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(html => {
            document.getElementById('gear-modal-container').innerHTML = html;
            // Initialize the first tab
            $('#settingsTabs a:first').tab('show');
            // Load saved settings
            loadSavedSettings();
        })
        .catch(error => {
            console.error('Error loading gear settings:', error);
        });
}

/**
 * Load content for the search modal
 */
function loadSearchContent() {
    fetch('/include_search_form.php')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(html => {
            document.getElementById('looking-glass-search-container').innerHTML = html;
        })
        .catch(error => {
            console.error('Error loading search form:', error);
        });
}

/**
 * Save user preferences to localStorage
 */
function saveSettings() {
    // Collect all settings from the form
    const settings = {
        display: {
            filterLiveVideos: $('#filterLiveVideos').is(':checked'),
            filterPhotos: $('#filterPhotos').is(':checked'),
            filterPastStreams: $('#filterPastStreams').is(':checked'),
            sortPreference: $('#sortPreference').val(),
            viewMode: $('input[name="viewMode"]:checked').attr('id')
        },
        video: {
            quality: $('#videoQuality').val(),
            notifications: $('#liveNotifications').is(':checked'),
            favoritesOnly: $('#favoritesNotifications').is(':checked'),
            enableChat: $('#enableChat').is(':checked'),
            enableReactions: $('#enableReactions').is(':checked')
        }
    };
    
    localStorage.setItem('galleryPreferences', JSON.stringify(settings));
    closeGearModal();
    alert('Settings saved successfully!');
}

/**
 * Load saved settings from localStorage
 */
function loadSavedSettings() {
    const savedSettings = localStorage.getItem('galleryPreferences');
    if (savedSettings) {
        const settings = JSON.parse(savedSettings);
        
        // Apply settings to the form elements
        if (settings.display) {
            $('#filterLiveVideos').prop('checked', settings.display.filterLiveVideos);
            $('#filterPhotos').prop('checked', settings.display.filterPhotos);
            $('#filterPastStreams').prop('checked', settings.display.filterPastStreams);
            $('#sortPreference').val(settings.display.sortPreference);
            $('#' + settings.display.viewMode).prop('checked', true);
        }
        
        if (settings.video) {
            $('#videoQuality').val(settings.video.quality);
            $('#liveNotifications').prop('checked', settings.video.notifications);
            $('#favoritesNotifications').prop('checked', settings.video.favoritesOnly);
            $('#enableChat').prop('checked', settings.video.enableChat);
            $('#enableReactions').prop('checked', settings.video.enableReactions);
        }
    }
}

/**
 * Enhance gallery display with improved visibility and sizing
 */
function enhanceGalleryDisplay() {
    // Simple function to ensure gallery is visible with proper sizing
    function ensureGalleryVisible() {
        // Check if gallery exists
        if ($('.pp_gallery_overflow').length) {
            // Only apply the most essential fixes to ensure visibility
            $('.pp_gallery_overflow').css({
                'display': 'block',
                'visibility': 'visible'
            });
            
            // Make sure the container is properly visible
            $('.pp_gallery_overflow .container').css({
                'display': 'block',
                'visibility': 'visible'
            });
            
            // Adjust any dynamically created gallery items
            $('.pp_gallery_overflow .gallery-item').css({
                'height': '560px', // Doubled height
                'display': 'inline-block',
                'visibility': 'visible'
            });
            
            console.log('Gallery visibility and height adjusted');
        }
    }
    
    // Run immediately and after a delay
    ensureGalleryVisible();
    setTimeout(ensureGalleryVisible, 500);
    
    // Also check after AJAX content loads
    $(document).ajaxComplete(function() {
        setTimeout(ensureGalleryVisible, 300);
    });
    
    // Make this function available globally for debugging
    window.fixGallery = ensureGalleryVisible;
}

/**
 * Check if the page was loaded directly from the menu
 */
function checkDirectAccess() {
    // Check if page was loaded from menu
    const urlParams = new URLSearchParams(window.location.search);
    const fromMenu = urlParams.get('from_menu');
    
    if (fromMenu === '1') {
        console.log("Looking Glass loaded from menu - performing extra initialization");
        
        // Force reflow/repaint of container to ensure visibility
        const container = document.getElementById('looking-glass-main-container');
        if (container) {
            container.style.display = 'none';
            setTimeout(() => {
                container.style.display = 'block';
                console.log("Looking Glass container display forced");
            }, 10);
        }
        
        // Make sure the Looking Glass is properly visible
        setTimeout(() => {
            document.querySelectorAll('.looking-glass-container').forEach(el => {
                el.style.display = 'block';
                el.style.visibility = 'visible';
                console.log("Looking Glass container visibility enforced");
            });
            
            // Force a tab click if needed
            const firstTab = document.querySelector('.photos-tab a');
            if (firstTab) {
                console.log("Triggering first tab click");
                firstTab.click();
            }
        }, 100);
    }
}

/**
 * Ensure proper centering of modals when shown
 */
function centerModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        const dialog = modal.querySelector('.modal-dialog');
        if (dialog) {
            dialog.style.margin = '0 auto';
            dialog.style.transform = 'none';
        }
    }
}

// Ensure modals are centered when shown
document.addEventListener('DOMContentLoaded', function () {
    const searchModal = document.getElementById('lookingGlassSearchModal');
    const gearModal = document.getElementById('gearModal');

    if (searchModal) {
        searchModal.addEventListener('show.bs.modal', function () {
            centerModal('lookingGlassSearchModal');
        });
    }

    if (gearModal) {
        gearModal.addEventListener('show.bs.modal', function () {
            centerModal('gearModal');
        });
    }
});

// Expose key functions globally
window.loadTab = loadTab;
window.openGearModal = openGearModal;
window.closeGearModal = closeGearModal;
window.showSearchModal = showSearchModal;
window.hideSearchModal = hideSearchModal;
window.fixGallery = enhanceGalleryDisplay;

// JavaScript for Looking Glass functionality

// Submit search form
function submitLookingGlassSearch() {
    const form = document.getElementById('lookingGlassSearchForm');
    const formData = new FormData(form);

    // Send AJAX request
    fetch('/LookingGlass.php', {
        method: 'POST',
        body: formData,
    })
        .then(response => response.json())
        .then(data => {
            console.log('Search results:', data);
            // Handle search results
        })
        .catch(error => console.error('Error:', error));
}

/**
 * Initialize location dropdowns in the search modal
 */
function initLocationDropdowns() {
    // Load countries when search modal is opened
    $('#lookingGlassSearchModal').on('shown.bs.modal', function() {
        loadCountries();
    });
}

/**
 * Load countries into the country dropdown
 */
function loadCountries() {
    // Clear the dropdown first
    const countrySelect = document.getElementById('searchCountry');
    if (!countrySelect) return;
    
    // Reset dependent dropdowns
    resetDependentDropdowns();
    
    // Check if we've already loaded countries
    if (countrySelect.options.length <= 1) {
        // Fetch countries from the server
        fetch('/ajax/get_countries.php')
            .then(response => response.json())
            .then(data => {
                if (data && data.length > 0) {
                    // Add countries to the dropdown
                    data.forEach(country => {
                        const option = document.createElement('option');
                        option.value = country.id;
                        option.textContent = country.name;
                        countrySelect.appendChild(option);
                    });
                } else {
                    // If no data or API fails, add some common countries as fallback
                    addFallbackCountries(countrySelect);
                }
            })
            .catch(error => {
                console.error('Error loading countries:', error);
                // Add fallback countries
                addFallbackCountries(countrySelect);
            });
    }
}

/**
 * Add fallback countries if API call fails
 * @param {HTMLSelectElement} selectElement - The country select element
 */
function addFallbackCountries(selectElement) {
    const countries = [
        { id: 'US', name: 'United States' },
        { id: 'CA', name: 'Canada' },
        { id: 'MX', name: 'Mexico' },
        { id: 'UK', name: 'United Kingdom' },
        { id: 'AU', name: 'Australia' },
        { id: 'DE', name: 'Germany' },
        { id: 'FR', name: 'France' },
        { id: 'JP', name: 'Japan' }
    ];
    
    countries.forEach(country => {
        const option = document.createElement('option');
        option.value = country.id;
        option.textContent = country.name;
        selectElement.appendChild(option);
    });
}

/**
 * Load states based on selected country
 * @param {string} countryId - Selected country ID
 */
function loadStates(countryId) {
    const stateSelect = document.getElementById('searchState');
    const citySelect = document.getElementById('searchCity');
    
    // Reset the state and city dropdowns
    stateSelect.innerHTML = '<option value="">Select State</option>';
    citySelect.innerHTML = '<option value="">Select City</option>';
    
    // Disable the city dropdown
    citySelect.disabled = true;
    
    if (!countryId) {
        stateSelect.disabled = true;
        return;
    }
    
    // Enable the state dropdown
    stateSelect.disabled = false;
    
    // Fetch states from the server
    fetch(`/ajax/get_states.php?country_id=${countryId}`)
        .then(response => response.json())
        .then(data => {
            if (data && data.length > 0) {
                // Add states to the dropdown
                data.forEach(state => {
                    const option = document.createElement('option');
                    option.value = state.id;
                    option.textContent = state.name;
                    stateSelect.appendChild(option);
                });
            } else {
                // If no data or API fails, add some fallback states for US
                if (countryId === 'US') {
                    addFallbackStates(stateSelect);
                }
            }
        })
        .catch(error => {
            console.error('Error loading states:', error);
            // Add fallback states for US
            if (countryId === 'US') {
                addFallbackStates(stateSelect);
            }
        });
}

/**
 * Add fallback states if API call fails
 * @param {HTMLSelectElement} selectElement - The state select element
 */
function addFallbackStates(selectElement) {
    const states = [
        { id: 'CA', name: 'California' },
        { id: 'NY', name: 'New York' },
        { id: 'TX', name: 'Texas' },
        { id: 'FL', name: 'Florida' },
        { id: 'IL', name: 'Illinois' }
    ];
    
    states.forEach(state => {
        const option = document.createElement('option');
        option.value = state.id;
        option.textContent = state.name;
        selectElement.appendChild(option);
    });
}

/**
 * Load cities based on selected state
 * @param {string} stateId - Selected state ID
 */
function loadCities(stateId) {
    const citySelect = document.getElementById('searchCity');
    
    // Reset the city dropdown
    citySelect.innerHTML = '<option value="">Select City</option>';
    
    if (!stateId) {
        citySelect.disabled = true;
        return;
    }
    
    // Enable the city dropdown
    citySelect.disabled = false;
    
    // Fetch cities from the server
    fetch(`/ajax/get_cities.php?state_id=${stateId}`)
        .then(response => response.json())
        .then(data => {
            if (data && data.length > 0) {
                // Add cities to the dropdown
                data.forEach(city => {
                    const option = document.createElement('option');
                    option.value = city.id;
                    option.textContent = city.name;
                    citySelect.appendChild(option);
                });
            } else {
                // If no data or API fails, add some fallback cities for CA
                if (stateId === 'CA') {
                    addFallbackCities(citySelect);
                }
            }
        })
        .catch(error => {
            console.error('Error loading cities:', error);
            // Add fallback cities for CA
            if (stateId === 'CA') {
                addFallbackCities(citySelect);
            }
        });
}

/**
 * Add fallback cities if API call fails
 * @param {HTMLSelectElement} selectElement - The city select element
 */
function addFallbackCities(selectElement) {
    const cities = [
        { id: 'LA', name: 'Los Angeles' },
        { id: 'SF', name: 'San Francisco' },
        { id: 'SD', name: 'San Diego' },
        { id: 'SJ', name: 'San Jose' },
        { id: 'SAC', name: 'Sacramento' }
    ];
    
    cities.forEach(city => {
        const option = document.createElement('option');
        option.value = city.id;
        option.textContent = city.name;
        selectElement.appendChild(option);
    });
}

/**
 * Reset dependent dropdowns (state and city)
 */
function resetDependentDropdowns() {
    const stateSelect = document.getElementById('searchState');
    const citySelect = document.getElementById('searchCity');
    
    if (stateSelect) {
        stateSelect.innerHTML = '<option value="">Select State</option>';
        stateSelect.disabled = true;
    }
    
    if (citySelect) {
        citySelect.innerHTML = '<option value="">Select City</option>';
        citySelect.disabled = true;
    }
}

// Expose location dropdown functions globally
window.loadCountries = loadCountries;
window.loadStates = loadStates;
window.loadCities = loadCities;

// ...existing code...

function loadUserPreferences() {
    // Load preferences from localStorage
    if (localStorage.getItem("defaultContent")) {
        document.getElementById("defaultContent").value = localStorage.getItem("defaultContent");
    } else {
        // Set default value to Photos if not set
        document.getElementById("defaultContent").value = "photos";
        localStorage.setItem("defaultContent", "photos");
    }

    // Apply the default view immediately when loading
    applyDefaultView();

    if (localStorage.getItem("sortPreference")) {
        let sortValue = localStorage.getItem("sortPreference");
        document.querySelector(`input[name="sort"][value="${sortValue}"]`).checked = true;
    }

    // ...existing code...
    
    if (localStorage.getItem("autoplayVideos") === "true") {
        document.getElementById("autoplayVideos").checked = true;
    }
    
    if (localStorage.getItem("hoverAutoplayVideos") === "true") {
        document.getElementById("hoverAutoplayVideos").checked = true;
    }
    
    if (localStorage.getItem("muteVideos") === "false") {
        document.getElementById("muteVideos").checked = false;
    }
}

function saveUserPreferences() {
    let defaultContent = document.getElementById("defaultContent").value;
    let sortPreference = document.querySelector('input[name="sort"]:checked').value;
    let showPhotos = document.getElementById("showPhotos").checked;
    let showVideos = document.getElementById("showVideos").checked;
    let showLiveStreams = document.getElementById("showLiveStreams").checked;
    let showPartyhouz = document.getElementById("showPartyhouz").checked;
    let notifyLiveStreams = document.getElementById("notifyLiveStreams").checked;
    let notifyPartyhouz = document.getElementById("notifyPartyhouz").checked;
    let itemsPerPage = document.getElementById("itemsPerPage").value;
    let autoplayVideos = document.getElementById("autoplayVideos").checked;
    let hoverAutoplayVideos = document.getElementById("hoverAutoplayVideos").checked;
    let muteVideos = document.getElementById("muteVideos").checked;

    // Store in Local Storage
    localStorage.setItem("defaultContent", defaultContent);
    localStorage.setItem("sortPreference", sortPreference);
    localStorage.setItem("showPhotos", showPhotos);
    localStorage.setItem("showVideos", showVideos);
    localStorage.setItem("showLiveStreams", showLiveStreams);
    localStorage.setItem("showPartyhouz", showPartyhouz);
    localStorage.setItem("notifyLiveStreams", notifyLiveStreams);
    localStorage.setItem("notifyPartyhouz", notifyPartyhouz);
    localStorage.setItem("itemsPerPage", itemsPerPage);
    localStorage.setItem("autoplayVideos", autoplayVideos);
    localStorage.setItem("hoverAutoplayVideos", hoverAutoplayVideos);
    localStorage.setItem("muteVideos", muteVideos);

    // Apply settings
    applyUserPreferences();
    
    // Close modal
    closeGearModal();
    
    // Optional: Show a confirmation
    showNotification("Preferences saved successfully!");
}

function applyUserPreferences() {
    // Apply content filters
    const showPhotos = localStorage.getItem("showPhotos") !== "false";
    const showVideos = localStorage.getItem("showVideos") !== "false";
    const showLiveStreams = localStorage.getItem("showLiveStreams") !== "false";
    const showPartyhouz = localStorage.getItem("showPartyhouz") !== "false";
    
    // Apply display settings
    // ...existing code...
    
    // Apply autoplay settings
    const autoplayVideos = localStorage.getItem("autoplayVideos") === "true";
    const hoverAutoplayVideos = localStorage.getItem("hoverAutoplayVideos") === "true";
    const muteVideos = localStorage.getItem("muteVideos") !== "false";
    
    $("video").each(function() {
        if (autoplayVideos) {
            $(this).attr("autoplay", true);
        } else {
            $(this).removeAttr("autoplay");
        }
        
        if (muteVideos) {
            $(this).attr("muted", true);
        } else {
            $(this).removeAttr("muted");
        }
    });
    
    // Setup hover autoplay if enabled
    if (hoverAutoplayVideos) {
        $('.video-item, .live-stream-item').on('mouseenter', function() {
            const video = $(this).find('video');
            if (video.length) {
                video[0].play();
            }
        }).on('mouseleave', function() {
            const video = $(this).find('video');
            if (video.length && !autoplayVideos) {
                video[0].pause();
            }
        });
    } else {
        // Remove hover events if disabled
        $('.video-item, .live-stream-item').off('mouseenter mouseleave');
    }
    
    // Apply default view if we're on the main page
    applyDefaultView();
}

/**
 * Apply the default view setting from local storage
 */
function applyDefaultView() {
    // Only apply this on page load, not when just updating preferences
    const defaultContent = localStorage.getItem("defaultContent") || "photos";
    
    // Don't change view if it's already been set by user
    if (!window.viewAlreadySet) {
        // Hide all content sections first
        $('.content-section').hide();
        
        // Show the default section
        switch (defaultContent) {
            case "photos":
                $('.photos-section').show();
                break;
            case "videos":
                $('.videos-section').show();
                break;
            case "live":
                $('.live-videos-section').show();
                break;
            case "partyhouz":
                $('.partyhouz-section').show();
                break;
            default:
                $('.photos-section').show();
        }
        
        // Mark that we've set the view
        window.viewAlreadySet = true;
    }
}

// ...existing code...

/**
 * Set up keyboard navigation for search autocomplete
 */
function setupSearchAutocomplete() {
    const searchInput = document.getElementById('searchKeyword');
    const suggestionsList = document.getElementById('searchAutocompleteSuggestions');
    
    if (!searchInput || !suggestionsList) return;
    
    let selectedIndex = -1;
    
    // Key navigation (up/down/enter)
    searchInput.addEventListener('keydown', function(e) {
        const suggestions = suggestionsList.querySelectorAll('.autocomplete-item');
        
        if (!suggestions.length) return;
        
        // Down arrow
        if (e.key === 'ArrowDown') {
            e.preventDefault();
            selectedIndex = Math.min(selectedIndex + 1, suggestions.length - 1);
            updateSelectedSuggestion(suggestions);
        }
        // Up arrow
        else if (e.key === 'ArrowUp') {
            e.preventDefault();
            selectedIndex = Math.max(selectedIndex - 1, -1);
            updateSelectedSuggestion(suggestions);
        }
        // Enter key
        else if (e.key === 'Enter' && selectedIndex >= 0) {
            e.preventDefault();
            suggestions[selectedIndex].click();
        }
        // Escape key
        else if (e.key === 'Escape') {
            suggestionsList.style.display = 'none';
            selectedIndex = -1;
        }
    });
    
    // Update selected suggestion visual
    function updateSelectedSuggestion(suggestions) {
        // Remove 'active' class from all suggestions
        suggestions.forEach(suggestion => suggestion.classList.remove('active'));
        
        // If a suggestion is selected, add 'active' class
        if (selectedIndex >= 0) {
            suggestions[selectedIndex].classList.add('active');
            suggestions[selectedIndex].scrollIntoView({ block: 'nearest', behavior: 'smooth' });
        }
    }
}

// Add this call to the DOMContentLoaded event or your initialization function
document.addEventListener('DOMContentLoaded', function() {
    // ...existing code...
    
    // Set up autocomplete keyboard navigation
    setupSearchAutocomplete();
});

// ...existing code...

/**
 * Initialize autocomplete for all search boxes
 */
function initAllAutocomplete() {
    // Setup the search modal autocomplete
    setupSearchAutocomplete();
    
    // Setup header search autocomplete
    setupHeaderAutocomplete();
}

/**
 * Setup autocomplete for header search
 */
function setupHeaderAutocomplete() {
    const headerSearchInput = document.querySelector('input[name="q"], .header-search');
    const headerSuggestionsList = document.getElementById('headerSearchAutocompleteSuggestions');
    
    if (!headerSearchInput || !headerSuggestionsList) return;
    
    let selectedIndex = -1;
    
    // Key navigation (up/down/enter)
    headerSearchInput.addEventListener('keydown', function(e) {
        const suggestions = headerSuggestionsList.querySelectorAll('.autocomplete-item');
        
        if (!suggestions.length) return;
        
        // Down arrow
        if (e.key === 'ArrowDown') {
            e.preventDefault();
            selectedIndex = Math.min(selectedIndex + 1, suggestions.length - 1);
            updateSelectedSuggestion(suggestions);
        }
        // Up arrow
        else if (e.key === 'ArrowUp') {
            e.preventDefault();
            selectedIndex = Math.max(selectedIndex - 1, -1);
            updateSelectedSuggestion(suggestions);
        }
        // Enter key
        else if (e.key === 'Enter' && selectedIndex >= 0) {
            e.preventDefault();
            suggestions[selectedIndex].click();
        }
        // Escape key
        else if (e.key === 'Escape') {
            headerSuggestionsList.style.display = 'none';
            selectedIndex = -1;
        }
    });
    
    // Update selected suggestion visual
    function updateSelectedSuggestion(suggestions) {
        // Remove 'active' class from all suggestions
        suggestions.forEach(suggestion => suggestion.classList.remove('active'));
        
        // If a suggestion is selected, add 'active' class
        if (selectedIndex >= 0) {
            suggestions[selectedIndex].classList.add('active');
            suggestions[selectedIndex].scrollIntoView({ block: 'nearest', behavior: 'smooth' });
        }
    }
}

// Update the initialization to include all autocomplete functions
document.addEventListener('DOMContentLoaded', function() {
    // ...existing code...
    
    // Initialize autocomplete for all search boxes
    initAllAutocomplete();
});

// Make the mock suggestions function available globally
window.getMockSuggestions = function(query) {
    const allSuggestions = [
        { id: 1, type: 'user', text: 'Sarah Johnson', avatar: '/images/avatars/user1.jpg' },
        { id: 2, type: 'user', text: 'Michael Smith', avatar: '/images/avatars/user2.jpg' },
        { id: 3, type: 'tag', text: 'party', count: 28 },
        { id: 4, type: 'tag', text: 'beach', count: 42 },
        { id: 5, type: 'tag', text: 'dancing', count: 15 },
        { id: 6, type: 'place', text: 'Miami Beach, FL', count: 67 },
        { id: 7, type: 'place', text: 'Las Vegas, NV', count: 53 },
        { id: 8, type: 'user', text: 'Jessica Williams', avatar: '/images/avatars/user3.jpg' },
        { id: 9, type: 'user', text: 'David Brown', avatar: '/images/avatars/user4.jpg' },
        { id: 10, type: 'tag', text: 'partynight', count: 12 }
    ];
    
    return allSuggestions.filter(item => 
        item.text.toLowerCase().includes(query.toLowerCase())
    ).slice(0, 5); // Only return top 5 matches
};

// Make debounce function globally available
window.debounce = function(func, delay) {
    let timeout;
    return function() {
        const context = this;
        const args = arguments;
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(context, args), delay);
    };
};

// ...existing code...

/**
 * Initialize shared autocomplete system between header and Looking Glass
 */
function initSharedAutocompleteSystem() {
    // Create a global autocomplete system that can be shared
    window.headerAutocompleteSystem = {
        suggestions: [],
        
        // Attach the autocomplete to an input field
        attachToInput: function(input, container) {
            if (!input || !container) return;
            
            // Store reference to the input and container
            this.currentInput = input;
            this.currentContainer = container;
            
            // Set up event listeners
            input.addEventListener('input', this.handleInput.bind(this));
            input.addEventListener('focus', this.handleFocus.bind(this));
            input.addEventListener('keydown', this.handleKeyDown.bind(this));
            
            // Hide suggestions when clicking outside
            document.addEventListener('click', (e) => {
                if (!e.target.closest('.autocomplete-wrapper')) {
                    container.style.display = 'none';
                    this.selectedIndex = -1;
                }
            });
            
            return this;
        },
        
        // Handle input events
        handleInput: function() {
            const query = this.currentInput.value.trim();
            
            if (query.length < 2) {
                this.currentContainer.style.display = 'none';
                return;
            }
            
            this.fetchSuggestions(query);
        },
        
        // Handle focus events
        handleFocus: function() {
            if (this.currentContainer.children.length > 0) {
                this.currentContainer.style.display = 'block';
            }
        },
        
        // Keyboard navigation
        selectedIndex: -1,
        handleKeyDown: function(e) {
            const suggestions = this.currentContainer.querySelectorAll('.autocomplete-item');
            
            if (!suggestions.length) return;
            
            // Navigation keys
            if (e.key === 'ArrowDown') {
                e.preventDefault();
                this.selectedIndex = Math.min(this.selectedIndex + 1, suggestions.length - 1);
                this.updateActiveSelection(suggestions);
            } else if (e.key === 'ArrowUp') {
                e.preventDefault();
                this.selectedIndex = Math.max(this.selectedIndex - 1, -1);
                this.updateActiveSelection(suggestions);
            } else if (e.key === 'Enter' && this.selectedIndex >= 0) {
                e.preventDefault();
                suggestions[this.selectedIndex].click();
            } else if (e.key === 'Escape') {
                this.currentContainer.style.display = 'none';
                this.selectedIndex = -1;
            }
        },
        
        // Update selected suggestion
        updateActiveSelection: function(items) {
            // Remove active class from all items
            items.forEach(item => item.classList.remove('active'));
            
            // Add active class to selected item
            if (this.selectedIndex >= 0) {
                items[this.selectedIndex].classList.add('active');
                
                // Ensure the item is visible in the suggestions container
                if (items[this.selectedIndex].scrollIntoView) {
                    items[this.selectedIndex].scrollIntoView({ block: 'nearest', behavior: 'smooth' });
                }
            }
        },
        
        // Fetch suggestions based on query
        fetchSuggestions: function(query) {
            // Store globally in case other components need access
            window.headerSearchData = [
                { id: 1, type: 'user', text: 'Sarah Johnson', avatar: '/images/avatars/user1.jpg' },
                { id: 2, type: 'user', text: 'Michael Smith', avatar: '/images/avatars/user2.jpg' },
                { id: 3, type: 'tag', text: 'party', count: 28 },
                { id: 4, type: 'tag', text: 'beach', count: 42 },
                { id: 5, type: 'tag', text: 'dancing', count: 15 },
                { id: 6, type: 'place', text: 'Miami Beach, FL', count: 67 },
                { id: 7, type: 'place', text: 'Las Vegas, NV', count: 53 },
                { id: 8, type: 'user', text: 'Jessica Williams', avatar: '/images/avatars/user3.jpg' },
                { id: 9, type: 'user', text: 'David Brown', avatar: '/images/avatars/user4.jpg' },
                { id: 10, type: 'tag', text: 'partynight', count: 12 },
                // Add more realistic data from your system
                { id: 11, type: 'user', text: 'Jennifer Lopez', avatar: '/images/avatars/user5.jpg' },
                { id: 12, type: 'user', text: 'John Parker', avatar: '/images/avatars/user6.jpg' },
                { id: 13, type: 'tag', text: 'nightlife', count: 53 },
                { id: 14, type: 'tag', text: 'singles', count: 112 },
                { id: 15, type: 'place', text: 'New York, NY', count: 234 },
                { id: 16, type: 'place', text: 'Los Angeles, CA', count: 189 },
                { id: 17, type: 'user', text: 'Sandra Martinez', avatar: '/images/avatars/user7.jpg' },
                { id: 18, type: 'tag', text: 'partner', count: 62 },
                { id: 19, type: 'tag', text: 'swingers', count: 76 },
                { id: 20, type: 'place', text: 'Chicago, IL', count: 122 }
            ];
            
            // In real implementation, you'd make an AJAX call here
            // For now, just filter the mock data
            const filteredSuggestions = window.headerSearchData.filter(item => 
                item.text.toLowerCase().includes(query.toLowerCase())
            ).slice(0, 5);
            
            this.displaySuggestions(filteredSuggestions);
        },
        
        // Display suggestions in the container
        displaySuggestions: function(suggestions) {
            // Store the suggestions for reference
            this.suggestions = suggestions;
            
            // Clear current suggestions
            this.currentContainer.innerHTML = '';
            
            if (suggestions.length === 0) {
                this.currentContainer.style.display = 'none';
                return;
            }
            
            // Create and append suggestion elements
            suggestions.forEach(suggestion => {
                const suggestionEl = document.createElement('div');
                suggestionEl.className = 'autocomplete-item';
                
                // Create content based on suggestion type
                let content = '';
                
                if (suggestion.type === 'user') {
                    content = `
                        <div class="suggestion-avatar">
                            <img src="${suggestion.avatar}" alt="${suggestion.text}">
                        </div>
                        <div class="suggestion-text">
                            <span class="suggestion-name">${suggestion.text}</span>
                            <span class="suggestion-type">User</span>
                        </div>
                    `;
                } else if (suggestion.type === 'tag') {
                    content = `
                        <div class="suggestion-icon">
                            <i class="fa fa-tag"></i>
                        </div>
                        <div class="suggestion-text">
                            <span class="suggestion-name">#${suggestion.text}</span>
                            <span class="suggestion-count">${suggestion.count} posts</span>
                        </div>
                    `;
                } else if (suggestion.type === 'place') {
                    content = `
                        <div class="suggestion-icon">
                            <i class="fa fa-map-marker"></i>
                        </div>
                        <div class="suggestion-text">
                            <span class="suggestion-name">${suggestion.text}</span>
                            <span class="suggestion-count">${suggestion.count} members</span>
                        </div>
                    `;
                }
                
                suggestionEl.innerHTML = content;
                
                // Add click handler
                suggestionEl.addEventListener('click', () => {
                    if (suggestion.type === 'tag') {
                        this.currentInput.value = '#' + suggestion.text;
                    } else {
                        this.currentInput.value = suggestion.text;
                    }
                    this.currentContainer.style.display = 'none';
                    
                    // If this is part of a form, auto-focus the next input or submit
                    const form = this.currentInput.closest('form');
                    if (form) {
                        const inputs = Array.from(form.querySelectorAll('input, select, textarea'));
                        const currentIndex = inputs.indexOf(this.currentInput);
                        if (currentIndex > -1 && currentIndex < inputs.length - 1) {
                            inputs[currentIndex + 1].focus();
                        }
                    }
                });
                
                this.currentContainer.appendChild(suggestionEl);
            });
            
            // Show the suggestions
            this.currentContainer.style.display = 'block';
        }
    };
    
    // Initialize the system with the header search if it exists
    const headerSearchInput = document.querySelector('input[name="q"], .header-search');
    const headerSuggestionsList = document.getElementById('headerSearchAutocompleteSuggestions');
    
    if (headerSearchInput && headerSuggestionsList) {
        window.headerAutocompleteSystem.attachToInput(headerSearchInput, headerSuggestionsList);
    }
}

// Initialize shared autocomplete system on document ready
document.addEventListener('DOMContentLoaded', function() {
    // Initialize the shared autocomplete system
    initSharedAutocompleteSystem();
    
    // ...existing code...
});

// ...existing code...

/**
 * Set up autocomplete functionality for search box
 */
function setupSearchAutocomplete() {
    // Get references to the search input and suggestions container
    const searchInput = document.getElementById('searchKeyword');
    const suggestionsList = document.getElementById('searchAutocompleteSuggestions');
    
    // Exit if either element is missing
    if (!searchInput || !suggestionsList) {
        console.warn('Search autocomplete elements not found');
        return;
    }
    
    console.log('Setting up search autocomplete for Looking Glass');
    
    // Set up event listeners
    searchInput.addEventListener('input', debounce(function() {
        handleSearchInput(searchInput, suggestionsList);
    }, 300));
    
    searchInput.addEventListener('focus', function() {
        if (suggestionsList.children.length > 0) {
            suggestionsList.style.display = 'block';
        }
    });
    
    // Hide suggestions when clicking outside
    document.addEventListener('click', function(e) {
        if (!e.target.closest('.autocomplete-wrapper')) {
            suggestionsList.style.display = 'none';
        }
    });
    
    // Add keyboard navigation
    let selectedIndex = -1;
    
    searchInput.addEventListener('keydown', function(e) {
        const suggestions = suggestionsList.querySelectorAll('.autocomplete-item');
        
        if (!suggestions.length) return;
        
        // Down arrow
        if (e.key === 'ArrowDown') {
            e.preventDefault();
            selectedIndex = Math.min(selectedIndex + 1, suggestions.length - 1);
            updateSelectedSuggestion(suggestions, selectedIndex);
        }
        // Up arrow
        else if (e.key === 'ArrowUp') {
            e.preventDefault();
            selectedIndex = Math.max(selectedIndex - 1, -1);
            updateSelectedSuggestion(suggestions, selectedIndex);
        }
        // Enter key
        else if (e.key === 'Enter' && selectedIndex >= 0) {
            e.preventDefault();
            suggestions[selectedIndex].click();
        }
        // Escape key
        else if (e.key === 'Escape') {
            suggestionsList.style.display = 'none';
            selectedIndex = -1;
        }
    });
}

// Update selected suggestion visual
function updateSelectedSuggestion(suggestions, selectedIndex) {
    // Remove active class from all suggestions
    suggestions.forEach(suggestion => suggestion.classList.remove('active'));
    
    // If a suggestion is selected, add active class
    if (selectedIndex >= 0) {
        suggestions[selectedIndex].classList.add('active');
        if (suggestions[selectedIndex].scrollIntoView) {
            suggestions[selectedIndex].scrollIntoView({ block: 'nearest', behavior: 'smooth' });
        }
    }
}

// Handle search input
function handleSearchInput(input, container) {
    const query = input.value.trim();
    
    if (query.length < 2) {
        container.style.display = 'none';
        return;
    }
    
    // Use the server endpoint for autocomplete if available
    fetchAutocompleteResults(query, function(suggestions) {
        displaySuggestions(suggestions, input, container);
    });
}

// Display suggestions in the dropdown
function displaySuggestions(suggestions, input, container) {
    // Clear current suggestions
    container.innerHTML = '';
    
    if (suggestions.length === 0) {
        container.style.display = 'none';
        return;
    }
    
    // Create and append suggestion elements
    suggestions.forEach(suggestion => {
        const suggestionEl = document.createElement('div');
        suggestionEl.className = 'autocomplete-item';
        
        // Create content based on suggestion type
        let content = '';
        
        if (suggestion.type === 'user') {
            content = `
                <div class="suggestion-avatar">
                    <img src="${suggestion.avatar}" alt="${suggestion.text}">
                </div>
                <div class="suggestion-text">
                    <span class="suggestion-name">${suggestion.text}</span>
                    <span class="suggestion-type">User</span>
                </div>
            `;
        } else if (suggestion.type === 'tag') {
            content = `
                <div class="suggestion-icon">
                    <i class="fa fa-tag"></i>
                </div>
                <div class="suggestion-text">
                    <span class="suggestion-name">#${suggestion.text}</span>
                    <span class="suggestion-count">${suggestion.count} posts</span>
                </div>
            `;
        } else if (suggestion.type === 'place') {
            content = `
                <div class="suggestion-icon">
                    <i class="fa fa-map-marker"></i>
                </div>
                <div class="suggestion-text">
                    <span class="suggestion-name">${suggestion.text}</span>
                    <span class="suggestion-count">${suggestion.count} members</span>
                </div>
            `;
        }
        
        suggestionEl.innerHTML = content;
        
        // Add click handler
        suggestionEl.addEventListener('click', function() {
            if (suggestion.type === 'tag') {
                input.value = '#' + suggestion.text;
            } else {
                input.value = suggestion.text;
            }
            container.style.display = 'none';
            
            // If this is part of a form, focus the next field
            const form = input.closest('form');
            if (form) {
                const inputs = Array.from(form.querySelectorAll('input:not([type=hidden]), select, textarea'));
                const currentIndex = inputs.indexOf(input);
                if (currentIndex > -1 && currentIndex < inputs.length - 1) {
                    inputs[currentIndex + 1].focus();
                }
            }
        });
        
        container.appendChild(suggestionEl);
    });
    
    // Show the suggestions
    container.style.display = 'block';
}

// Mock suggestions data source
function getMockSuggestions(query) {
    const allSuggestions = [
        { id: 1, type: 'user', text: 'Sarah Johnson', avatar: '/images/avatars/user1.jpg' },
        { id: 2, type: 'user', text: 'Michael Smith', avatar: '/images/avatars/user2.jpg' },
        { id: 3, type: 'tag', text: 'party', count: 28 },
        { id: 4, type: 'tag', text: 'beach', count: 42 },
        { id: 5, type: 'tag', text: 'dancing', count: 15 },
        { id: 6, type: 'place', text: 'Miami Beach, FL', count: 67 },
        { id: 7, type: 'place', text: 'Las Vegas, NV', count: 53 },
        { id: 8, type: 'user', text: 'Jessica Williams', avatar: '/images/avatars/user3.jpg' },
        { id: 9, type: 'user', text: 'David Brown', avatar: '/images/avatars/user4.jpg' },
        { id: 10, type: 'tag', text: 'partynight', count: 12 }
    ];
    
    return allSuggestions.filter(item => 
        item.text.toLowerCase().includes(query.toLowerCase())
    ).slice(0, 5); // Only return top 5 matches
}

// Debounce function to limit API calls
function debounce(func, delay) {
    let timeout;
    return function() {
        const context = this;
        const args = arguments;
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(context, args), delay);
    };
}

// Make functions globally available
window.setupSearchAutocomplete = setupSearchAutocomplete;
window.getMockSuggestions = getMockSuggestions;
window.debounce = debounce;
window.handleSearchInput = handleSearchInput;
window.displaySuggestions = displaySuggestions;

// ...existing code...

/**
 * Get mock suggestions for search autocomplete
 * @param {string} query - The search query
 * @return {Array} - Array of suggestion objects
 */
function getMockSuggestions(query) {
    // Mock suggestion data - in production, this would come from an API
    const allSuggestions = [
        { id: 1, type: 'user', text: 'Sarah Johnson', avatar: '/images/avatars/user1.jpg' },
        { id: 2, type: 'user', text: 'Michael Smith', avatar: '/images/avatars/user2.jpg' },
        { id: 3, type: 'tag', text: 'party', count: 28 },
        { id: 4, type: 'tag', text: 'beach', count: 42 },
        { id: 5, type: 'tag', text: 'dancing', count: 15 },
        { id: 6, type: 'place', text: 'Miami Beach, FL', count: 67 },
        { id: 7, type: 'place', text: 'Las Vegas, NV', count: 53 },
        { id: 8, type: 'user', text: 'Jessica Williams', avatar: '/images/avatars/user3.jpg' },
        { id: 9, type: 'user', text: 'David Brown', avatar: '/images/avatars/user4.jpg' },
        { id: 10, type: 'tag', text: 'partynight', count: 12 },
        { id: 11, type: 'user', text: 'Jennifer Lopez', avatar: '/images/avatars/user5.jpg' },
        { id: 12, type: 'user', text: 'John Parker', avatar: '/images/avatars/user6.jpg' },
        { id: 13, type: 'tag', text: 'nightlife', count: 53 },
        { id: 14, type: 'tag', text: 'singles', count: 112 },
        { id: 15, type: 'place', text: 'New York, NY', count: 234 }
    ];
    
    // Filter suggestions based on query
    return allSuggestions.filter(item => 
        item.text.toLowerCase().includes(query.toLowerCase())
    ).slice(0, 5); // Only return top 5 matches
}

// Make the function globally available
window.getMockSuggestions = getMockSuggestions;

// ...existing code...

/**
 * Fetch autocomplete suggestions from the server
 * @param {string} query - The search query
 * @param {Function} callback - Callback function to handle results
 */
function fetchAutocompleteResults(query, callback) {
    // Create URL with cache-busting parameter
    const url = `${window.location.origin}/LookingGlass.php?autocomplete=1&query=${encodeURIComponent(query)}&_=${Date.now()}`;
    
    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            callback(data);
        })
        .catch(error => {
            console.error('Error fetching autocomplete suggestions:', error);
            // Fall back to mock suggestions
            callback(getMockSuggestions(query));
        });
}

/**
 * Handle search input and fetch autocomplete suggestions
 * @param {HTMLInputElement} input - The search input element
 * @param {HTMLElement} container - The suggestions container element
 */
function handleSearchInput(input, container) {
    const query = input.value.trim();
    
    if (query.length < 2) {
        container.style.display = 'none';
        return;
    }
    
    // Use the server endpoint for autocomplete if available
    fetchAutocompleteResults(query, function(suggestions) {
        displaySuggestions(suggestions, input, container);
    });
}

// Override the getMockSuggestions function to ensure it returns the expected format
window.getMockSuggestions = function(query) {
    const allSuggestions = [
        { id: 1, type: 'user', text: 'Sarah Johnson', avatar: '/images/avatars/user1.jpg' },
        { id: 2, type: 'user', text: 'Michael Smith', avatar: '/images/avatars/user2.jpg' },
        { id: 3, type: 'tag', text: 'party', count: 28 },
        { id: 4, type: 'tag', text: 'beach', count: 42 },
        { id: 5, type: 'tag', text: 'dancing', count: 15 },
        { id: 6, type: 'place', text: 'Miami Beach, FL', count: 67 },
        { id: 7, type: 'place', text: 'Las Vegas, NV', count: 53 },
        { id: 8, type: 'user', text: 'Jessica Williams', avatar: '/images/avatars/user3.jpg' },
        { id: 9, type: 'user', text: 'David Brown', avatar: '/images/avatars/user4.jpg' },
        { id: 10, type: 'tag', text: 'partynight', count: 12 }
    ];
    
    return allSuggestions.filter(item => 
        item.text.toLowerCase().includes(query.toLowerCase())
    ).slice(0, 5); // Only return top 5 matches
};

// ...existing code...
