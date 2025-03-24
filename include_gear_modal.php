<?php
/* Helper script to extract and serve gear modal content */

$gearModalContent = <<<EOT
<div class="tab-content p-3" id="settingsTabContent">
    <!-- Content Display Tab -->
    <div class="tab-pane fade show active" id="display" role="tabpanel">
        <h4>Content Display Customization</h4>
        
        <div class="form-group">
            <label>Filter Content By:</label>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="filterLiveVideos" checked>
                <label class="custom-control-label" for="filterLiveVideos">Live Videos</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="filterPhotos" checked>
                <label class="custom-control-label" for="filterPhotos">Photos</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="filterPastStreams" checked>
                <label class="custom-control-label" for="filterPastStreams">Past Streams</label>
            </div>
        </div>
        
        <div class="form-group">
            <label for="sortPreference">Sort Content By:</label>
            <select class="form-control" id="sortPreference">
                <option value="popular">Popularity</option>
                <option value="newest">Upload Date (Newest First)</option>
                <option value="oldest">Upload Date (Oldest First)</option>
                <option value="relevance">Relevance</option>
            </select>
        </div>
        
        <div class="form-group">
            <label>View Mode:</label>
            <div class="btn-group btn-group-toggle" data-toggle="buttons">
                <label class="btn btn-outline-primary active">
                    <input type="radio" name="viewMode" id="gridView" checked> Grid View
                </label>
                <label class="btn btn-outline-primary">
                    <input type="radio" name="viewMode" id="listView"> List View
                </label>
            </div>
        </div>
    </div>
    
    <!-- Live Video Tab -->
    <div class="tab-pane fade" id="video" role="tabpanel">
        <h4>Live Video Settings</h4>
        
        <div class="form-group">
            <label for="videoQuality">Video Quality:</label>
            <select class="form-control" id="videoQuality">
                <option value="auto">Auto (Recommended)</option>
                <option value="1080p">1080p HD</option>
                <option value="720p">720p HD</option>
                <option value="480p">480p</option>
                <option value="360p">360p</option>
                <option value="240p">240p</option>
            </select>
        </div>
        
        <div class="form-group">
            <label>Notifications:</label>
            <div class="custom-control custom-switch">
                <input type="checkbox" class="custom-control-input" id="liveNotifications" checked>
                <label class="custom-control-label" for="liveNotifications">Notify me when streams begin</label>
            </div>
            <div class="custom-control custom-switch mt-2">
                <input type="checkbox" class="custom-control-input" id="favoritesNotifications" checked>
                <label class="custom-control-label" for="favoritesNotifications">Only notify for favorites</label>
            </div>
        </div>
        
        <div class="form-group">
            <label>Interactive Features:</label>
            <div class="custom-control custom-switch">
                <input type="checkbox" class="custom-control-input" id="enableChat" checked>
                <label class="custom-control-label" for="enableChat">Enable chat during live streams</label>
            </div>
            <div class="custom-control custom-switch mt-2">
                <input type="checkbox" class="custom-control-input" id="enableReactions" checked>
                <label class="custom-control-label" for="enableReactions">Show reactions</label>
            </div>
        </div>
    </div>
    
    <!-- Additional tabs would go here -->
    <!-- ... -->
</div>
EOT;

// Output the gear modal content
echo $gearModalContent;
?>
