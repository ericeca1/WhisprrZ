<?php
/* Helper script to extract looking glass search form content */

// Hard-code the correct path based on server structure
$searchFormPath = realpath($_SERVER['DOCUMENT_ROOT']) . '/_frameworks/main/whisprrz_Edge/looking_glass_search.html';

// If that doesn't work, try a more flexible approach
if (!file_exists($searchFormPath)) {
    // Start from document root and traverse upward if needed
    $possiblePaths = [
        $_SERVER['DOCUMENT_ROOT'] . '/_frameworks/main/whisprrz_Edge/looking_glass_search.html',
        dirname($_SERVER['DOCUMENT_ROOT']) . '/_frameworks/main/whisprrz_Edge/looking_glass_search.html',
        dirname(dirname($_SERVER['DOCUMENT_ROOT'])) . '/_frameworks/main/whisprrz_Edge/looking_glass_search.html',
        dirname(__FILE__) . '/_frameworks/main/whisprrz_Edge/looking_glass_search.html',
        dirname(__FILE__) . '/../_frameworks/main/whisprrz_Edge/looking_glass_search.html',
    ];
    
    foreach ($possiblePaths as $path) {
        if (file_exists($path)) {
            $searchFormPath = $path;
            break;
        }
    }
}

// If we still can't find it, generate the form directly
if (!file_exists($searchFormPath)) {
    // Output a complete form without depending on the template file
    echo '
    <form action="looking_glass.php" id="looking-glass-search-form" method="GET">
        <input type="hidden" name="uid" value="">
        <input type="hidden" name="search" value="1">
        
        <div class="form-group">
            <label>Location:</label>
            <div class="calendar-location">
                <select name="country_id" id="country" class="form-control">
                    <option value="">Select Country</option>
                </select>
                <select name="state_id" id="state" class="form-control">
                    <option value="">Select State</option>
                </select>
                <select name="city_id" id="city" class="form-control">
                    <option value="">Select City</option>
                </select>
            </div>
        </div>
        
        <div class="form-group">
            <label>Looking For:</label>
            <div class="looking_for">
                <div class="form-check">
                    <input type="checkbox" id="looking_for_couple" name="looking_for_couple" value="1" checked>
                    <label for="looking_for_couple" style="font-weight: normal; margin-left: 5px;">Couples</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" id="looking_for_female" name="looking_for_female" value="1" checked>
                    <label for="looking_for_female" style="font-weight: normal; margin-left: 5px;">Single Female</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" id="looking_for_male" name="looking_for_male" value="1" checked>
                    <label for="looking_for_male" style="font-weight: normal; margin-left: 5px;">Single Male</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" id="looking_for_transgender" name="looking_for_transgender" value="1" checked>
                    <label for="looking_for_transgender" style="font-weight: normal; margin-left: 5px;">Transgender</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" id="looking_for_nonbinary" name="looking_for_nonbinary" value="1" checked>
                    <label for="looking_for_nonbinary" style="font-weight: normal; margin-left: 5px;">Nonbinary</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" id="looking_for_fullswap" name="looking_for_fullswap" value="1" checked>
                    <label for="looking_for_fullswap" style="font-weight: normal; margin-left: 5px;">FullSwap</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" id="looking_for_softswap" name="looking_for_softswap" value="1" checked>
                    <label for="looking_for_softswap" style="font-weight: normal; margin-left: 5px;">SoftSwap</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" id="looking_for_bdsm" name="looking_for_bdsm" value="1" checked>
                    <label for="looking_for_bdsm" style="font-weight: normal; margin-left: 5px;">BDSM</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" id="looking_for_voyeurism" name="looking_for_voyeurism" value="1" checked>
                    <label for="looking_for_transgender" style="font-weight: normal; margin-left: 5px;">voyeurism</label>
                </div>
            </div>
        </div>
        
      
        
        <div class="form-group">
            <div class="search-date-distance">
                <div class="calendar-search-date">
                    <label>Date</label>
                    <div class="calendar-date">
                        <select name="calendar_month" id="calendar_month" class="form-control">
                            <option value="1">January</option>
                            <option value="2">February</option>
                            <option value="3">March</option>
                            <option value="4">April</option>
                            <option value="5">May</option>
                            <option value="6">June</option>
                            <option value="7">July</option>
                            <option value="8">August</option>
                            <option value="9">September</option>
                            <option value="10">October</option>
                            <option value="11">November</option>
                            <option value="12">December</option>
                        </select>
                        <select name="calendar_year" id="calendar_year" class="form-control">
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                            <option value="2025">2025</option>
                        </select>
                    </div>
                </div>
                
                <div class="calendar-search-distance">
                    <label>Distance</label>
                    <select name="calendar_distance" id="calendar_distance" class="form-control">
                        <option value="10">10 miles</option>
                        <option value="25">25 miles</option>
                        <option value="50">50 miles</option>
                        <option value="100">100 miles</option>
                        <option value="500">500 miles</option>
                    </select>
                </div>
            </div>
        </div>
    </form>';
    exit;
}

// If we found the file, output the form content
$searchFormContent = file_get_contents($searchFormPath);

// Extract just the looking-glass-search part using regex
if (preg_match('/<!-- begin_looking_glass_search -->(.*?)<!-- end_looking_glass_search -->/s', $searchFormContent, $matches)) {
    echo $matches[1];
} else {
    echo 'Could not find the looking glass search form section in the file.';
}
?>
