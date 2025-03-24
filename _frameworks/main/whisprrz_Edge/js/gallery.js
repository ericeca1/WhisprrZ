/**
 * Looking Glass Gallery JavaScript
 * Handles gallery display, tab navigation, modals and user preferences for the Looking Glass feature
 */

$(document).ready(function() {
    console.log("Gallery.js initialized");
    initializeGallery();
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
        modal.style.display = 'block';
        document.body.style.overflow = 'hidden'; // Prevent background scrolling
        centerModal('gearModal');
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
