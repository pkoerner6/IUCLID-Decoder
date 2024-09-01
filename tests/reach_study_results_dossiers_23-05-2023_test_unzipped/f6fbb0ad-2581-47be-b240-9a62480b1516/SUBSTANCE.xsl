<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/SUBSTANCE/7.0" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <link href="iuclid6_style.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <table>
                    <tr/>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//i6c:PlatformMetadata | //i6c:Attachments | //i6c:ModificationHistory"/>
    <xsl:template match="//xt:SUBSTANCE">
        <tr class="headerDocument">
            <td>Substance</td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:Manufacturer | //xt:Importer | //xt:OnlyRepresentative | //xt:DownstreamUser">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'OnlyRepresentative'">Only representative</xsl:when>
                    <xsl:when test="name(.) = 'DownstreamUser'">Downstream user</xsl:when>
                    <xsl:when test="name(.) = 'Manufacturer'">Manufacturer</xsl:when>
                    <xsl:when test="name(.) = 'Importer'">Importer</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataProtection | //xt:OwnerLegalEntityProtection | //xt:ThirdPartyProtection | //xt:DataProtection | //xt:Protection | //xt:RoleProtection">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'OwnerLegalEntityProtection'">Legal entity flags</xsl:when>
                    <xsl:when test="name(.) = 'RoleProtection'">Role flags</xsl:when>
                    <xsl:when test="name(.) = 'DataProtection'">Person flags</xsl:when>
                    <xsl:when test="name(.) = 'Protection'">Reference substance flags</xsl:when>
                    <xsl:when test="name(.) = 'ThirdPartyProtection'">Third party flags</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:apply-templates/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:OwnerLegalEntity | //xt:ThirdParty | //xt:ContactPerson | //xt:ReferenceSubstance">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'OwnerLegalEntity'">Legal entity</xsl:when>
                    <xsl:when test="name(.) = 'ReferenceSubstance'">Reference substance</xsl:when>
                    <xsl:when test="name(.) = 'ThirdParty'">Third party</xsl:when>
                    <xsl:when test="name(.) = 'ContactPerson'">Person</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Country">
        <tr>
            <td class="label">Country</td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '2683'">Afghanistan</xsl:when>
                    <xsl:when test="./i6:value = '2684'">Albania</xsl:when>
                    <xsl:when test="./i6:value = '2685'">Algeria</xsl:when>
                    <xsl:when test="./i6:value = '2686'">American Samoa</xsl:when>
                    <xsl:when test="./i6:value = '2688'">Andorra</xsl:when>
                    <xsl:when test="./i6:value = '2689'">Angola</xsl:when>
                    <xsl:when test="./i6:value = '2690'">Anguilla</xsl:when>
                    <xsl:when test="./i6:value = '2692'">Antarctica</xsl:when>
                    <xsl:when test="./i6:value = '2695'">Antigua and Barbuda</xsl:when>
                    <xsl:when test="./i6:value = '2696'">Argentina</xsl:when>
                    <xsl:when test="./i6:value = '2697'">Armenia</xsl:when>
                    <xsl:when test="./i6:value = '2698'">Aruba</xsl:when>
                    <xsl:when test="./i6:value = '107'">Australia</xsl:when>
                    <xsl:when test="./i6:value = '108'">Austria</xsl:when>
                    <xsl:when test="./i6:value = '2701'">Azerbaijan</xsl:when>
                    <xsl:when test="./i6:value = '2702'">Bahamas (the)</xsl:when>
                    <xsl:when test="./i6:value = '2703'">Bahrain</xsl:when>
                    <xsl:when test="./i6:value = '2704'">Bangladesh</xsl:when>
                    <xsl:when test="./i6:value = '2705'">Barbados</xsl:when>
                    <xsl:when test="./i6:value = '2707'">Belarus</xsl:when>
                    <xsl:when test="./i6:value = '147'">Belgium</xsl:when>
                    <xsl:when test="./i6:value = '2708'">Belize</xsl:when>
                    <xsl:when test="./i6:value = '2709'">Benin</xsl:when>
                    <xsl:when test="./i6:value = '2710'">Bermuda</xsl:when>
                    <xsl:when test="./i6:value = '2711'">Bhutan</xsl:when>
                    <xsl:when test="./i6:value = '2720'">Bolivia (Plurinational State of)</xsl:when>
                    <xsl:when test="./i6:value = '65600'">Bonaire, Sint Eustatius and Saba</xsl:when>
                    <xsl:when test="./i6:value = '2722'">Bosnia and Herzegovina</xsl:when>
                    <xsl:when test="./i6:value = '2723'">Botswana</xsl:when>
                    <xsl:when test="./i6:value = '2724'">Bouvet Island</xsl:when>
                    <xsl:when test="./i6:value = '2725'">Brazil</xsl:when>
                    <xsl:when test="./i6:value = '2726'">British Indian Ocean Territory (the)</xsl:when>
                    <xsl:when test="./i6:value = '2727'">Brunei Darussalam</xsl:when>
                    <xsl:when test="./i6:value = '184'">Bulgaria</xsl:when>
                    <xsl:when test="./i6:value = '2729'">Burkina Faso</xsl:when>
                    <xsl:when test="./i6:value = '2730'">Burundi</xsl:when>
                    <xsl:when test="./i6:value = '2736'">Cabo Verde</xsl:when>
                    <xsl:when test="./i6:value = '2734'">Cambodia</xsl:when>
                    <xsl:when test="./i6:value = '2735'">Cameroon</xsl:when>
                    <xsl:when test="./i6:value = '206'">Canada</xsl:when>
                    <xsl:when test="./i6:value = '2746'">Cayman Islands (the)</xsl:when>
                    <xsl:when test="./i6:value = '2747'">Central African Republic (the)</xsl:when>
                    <xsl:when test="./i6:value = '2748'">Chad</xsl:when>
                    <xsl:when test="./i6:value = '2749'">Chile</xsl:when>
                    <xsl:when test="./i6:value = '2750'">China</xsl:when>
                    <xsl:when test="./i6:value = '2751'">Christmas Island</xsl:when>
                    <xsl:when test="./i6:value = '2754'">Cocos (Keeling) Islands (the)</xsl:when>
                    <xsl:when test="./i6:value = '2755'">Colombia</xsl:when>
                    <xsl:when test="./i6:value = '2759'">Comoros (the)</xsl:when>
                    <xsl:when test="./i6:value = '2765'">Congo (the Democratic Republic of the)</xsl:when>
                    <xsl:when test="./i6:value = '2764'">Congo (the)</xsl:when>
                    <xsl:when test="./i6:value = '2769'">Cook Islands (the)</xsl:when>
                    <xsl:when test="./i6:value = '2771'">Costa Rica</xsl:when>
                    <xsl:when test="./i6:value = '286'">Croatia</xsl:when>
                    <xsl:when test="./i6:value = '2773'">Cuba</xsl:when>
                    <xsl:when test="./i6:value = '65601'">Curaçao</xsl:when>
                    <xsl:when test="./i6:value = '304'">Cyprus</xsl:when>
                    <xsl:when test="./i6:value = '307'">Czechia</xsl:when>
                    <xsl:when test="./i6:value = '2774'">Côte d'Ivoire</xsl:when>
                    <xsl:when test="./i6:value = '333'">Denmark</xsl:when>
                    <xsl:when test="./i6:value = '2790'">Djibouti</xsl:when>
                    <xsl:when test="./i6:value = '2791'">Dominica</xsl:when>
                    <xsl:when test="./i6:value = '2792'">Dominican Republic (the)</xsl:when>
                    <xsl:when test="./i6:value = '2799'">Ecuador</xsl:when>
                    <xsl:when test="./i6:value = '2800'">Egypt</xsl:when>
                    <xsl:when test="./i6:value = '2801'">El Salvador</xsl:when>
                    <xsl:when test="./i6:value = '2803'">Equatorial Guinea</xsl:when>
                    <xsl:when test="./i6:value = '2804'">Eritrea</xsl:when>
                    <xsl:when test="./i6:value = '754'">Estonia</xsl:when>
                    <xsl:when test="./i6:value = '3358'">Eswatini</xsl:when>
                    <xsl:when test="./i6:value = '2805'">Ethiopia</xsl:when>
                    <xsl:when test="./i6:value = '2813'">Falkland Islands (the) [Malvinas]</xsl:when>
                    <xsl:when test="./i6:value = '2815'">Faroe Islands (the)</xsl:when>
                    <xsl:when test="./i6:value = '2817'">Fiji</xsl:when>
                    <xsl:when test="./i6:value = '766'">Finland</xsl:when>
                    <xsl:when test="./i6:value = '779'">France</xsl:when>
                    <xsl:when test="./i6:value = '2825'">French Guiana</xsl:when>
                    <xsl:when test="./i6:value = '2826'">French Polynesia</xsl:when>
                    <xsl:when test="./i6:value = '2827'">French Southern Territories (the)</xsl:when>
                    <xsl:when test="./i6:value = '2828'">Gabon</xsl:when>
                    <xsl:when test="./i6:value = '2829'">Gambia (the)</xsl:when>
                    <xsl:when test="./i6:value = '2834'">Georgia</xsl:when>
                    <xsl:when test="./i6:value = '807'">Germany</xsl:when>
                    <xsl:when test="./i6:value = '2835'">Ghana</xsl:when>
                    <xsl:when test="./i6:value = '2836'">Gibraltar</xsl:when>
                    <xsl:when test="./i6:value = '810'">Greece</xsl:when>
                    <xsl:when test="./i6:value = '2838'">Greenland</xsl:when>
                    <xsl:when test="./i6:value = '2839'">Grenada</xsl:when>
                    <xsl:when test="./i6:value = '2840'">Guadeloupe</xsl:when>
                    <xsl:when test="./i6:value = '2841'">Guam</xsl:when>
                    <xsl:when test="./i6:value = '2842'">Guatemala</xsl:when>
                    <xsl:when test="./i6:value = '7818'">Guernsey</xsl:when>
                    <xsl:when test="./i6:value = '2843'">Guinea</xsl:when>
                    <xsl:when test="./i6:value = '2844'">Guinea-Bissau</xsl:when>
                    <xsl:when test="./i6:value = '2845'">Guyana</xsl:when>
                    <xsl:when test="./i6:value = '2846'">Haiti</xsl:when>
                    <xsl:when test="./i6:value = '2851'">Heard Island and McDonald Islands</xsl:when>
                    <xsl:when test="./i6:value = '2854'">Holy See (the)</xsl:when>
                    <xsl:when test="./i6:value = '2855'">Honduras</xsl:when>
                    <xsl:when test="./i6:value = '2856'">Hong Kong</xsl:when>
                    <xsl:when test="./i6:value = '845'">Hungary</xsl:when>
                    <xsl:when test="./i6:value = '882'">Iceland</xsl:when>
                    <xsl:when test="./i6:value = '2865'">India</xsl:when>
                    <xsl:when test="./i6:value = '2866'">Indonesia</xsl:when>
                    <xsl:when test="./i6:value = '2870'">Iran (Islamic Republic of)</xsl:when>
                    <xsl:when test="./i6:value = '2871'">Iraq</xsl:when>
                    <xsl:when test="./i6:value = '911'">Ireland</xsl:when>
                    <xsl:when test="./i6:value = '7819'">Isle of Man</xsl:when>
                    <xsl:when test="./i6:value = '2876'">Israel</xsl:when>
                    <xsl:when test="./i6:value = '916'">Italy</xsl:when>
                    <xsl:when test="./i6:value = '2877'">Jamaica</xsl:when>
                    <xsl:when test="./i6:value = '918'">Japan</xsl:when>
                    <xsl:when test="./i6:value = '7820'">Jersey</xsl:when>
                    <xsl:when test="./i6:value = '2878'">Jordan</xsl:when>
                    <xsl:when test="./i6:value = '2879'">Kazakhstan</xsl:when>
                    <xsl:when test="./i6:value = '2880'">Kenya</xsl:when>
                    <xsl:when test="./i6:value = '2881'">Kiribati</xsl:when>
                    <xsl:when test="./i6:value = '2882'">Korea (the Democratic People's Republic of)</xsl:when>
                    <xsl:when test="./i6:value = '2883'">Korea (the Republic of)</xsl:when>
                    <xsl:when test="./i6:value = '2884'">Kuwait</xsl:when>
                    <xsl:when test="./i6:value = '2885'">Kyrgyzstan</xsl:when>
                    <xsl:when test="./i6:value = '2886'">Lao People's Democratic Republic (the)</xsl:when>
                    <xsl:when test="./i6:value = '985'">Latvia</xsl:when>
                    <xsl:when test="./i6:value = '2887'">Lebanon</xsl:when>
                    <xsl:when test="./i6:value = '2888'">Lesotho</xsl:when>
                    <xsl:when test="./i6:value = '2889'">Liberia</xsl:when>
                    <xsl:when test="./i6:value = '2890'">Libya</xsl:when>
                    <xsl:when test="./i6:value = '2891'">Liechtenstein</xsl:when>
                    <xsl:when test="./i6:value = '1024'">Lithuania</xsl:when>
                    <xsl:when test="./i6:value = '1041'">Luxembourg</xsl:when>
                    <xsl:when test="./i6:value = '2896'">Macao</xsl:when>
                    <xsl:when test="./i6:value = '2898'">Madagascar</xsl:when>
                    <xsl:when test="./i6:value = '2899'">Malawi</xsl:when>
                    <xsl:when test="./i6:value = '2900'">Malaysia</xsl:when>
                    <xsl:when test="./i6:value = '2901'">Maldives</xsl:when>
                    <xsl:when test="./i6:value = '2902'">Mali</xsl:when>
                    <xsl:when test="./i6:value = '1048'">Malta</xsl:when>
                    <xsl:when test="./i6:value = '2904'">Marshall Islands (the)</xsl:when>
                    <xsl:when test="./i6:value = '2905'">Martinique</xsl:when>
                    <xsl:when test="./i6:value = '2908'">Mauritania</xsl:when>
                    <xsl:when test="./i6:value = '2909'">Mauritius</xsl:when>
                    <xsl:when test="./i6:value = '2910'">Mayotte</xsl:when>
                    <xsl:when test="./i6:value = '1067'">Mexico</xsl:when>
                    <xsl:when test="./i6:value = '3877'">Micronesia (Federated States of)</xsl:when>
                    <xsl:when test="./i6:value = '2919'">Moldova (the Republic of)</xsl:when>
                    <xsl:when test="./i6:value = '2921'">Monaco</xsl:when>
                    <xsl:when test="./i6:value = '2922'">Mongolia</xsl:when>
                    <xsl:when test="./i6:value = '7821'">Montenegro</xsl:when>
                    <xsl:when test="./i6:value = '2924'">Montserrat</xsl:when>
                    <xsl:when test="./i6:value = '2925'">Morocco</xsl:when>
                    <xsl:when test="./i6:value = '2926'">Mozambique</xsl:when>
                    <xsl:when test="./i6:value = '2930'">Myanmar</xsl:when>
                    <xsl:when test="./i6:value = '2932'">Namibia</xsl:when>
                    <xsl:when test="./i6:value = '2933'">Nauru</xsl:when>
                    <xsl:when test="./i6:value = '2934'">Nepal</xsl:when>
                    <xsl:when test="./i6:value = '1158'">Netherlands (the)</xsl:when>
                    <xsl:when test="./i6:value = '2935'">Netherlands Antilles</xsl:when>
                    <xsl:when test="./i6:value = '2938'">New Caledonia</xsl:when>
                    <xsl:when test="./i6:value = '1161'">New Zealand</xsl:when>
                    <xsl:when test="./i6:value = '2939'">Nicaragua</xsl:when>
                    <xsl:when test="./i6:value = '2940'">Niger (the)</xsl:when>
                    <xsl:when test="./i6:value = '2941'">Nigeria</xsl:when>
                    <xsl:when test="./i6:value = '2942'">Niue</xsl:when>
                    <xsl:when test="./i6:value = '2945'">Norfolk Island</xsl:when>
                    <xsl:when test="./i6:value = '2897'">North Macedonia</xsl:when>
                    <xsl:when test="./i6:value = '2946'">Northern Mariana Islands (the)</xsl:when>
                    <xsl:when test="./i6:value = '1175'">Norway</xsl:when>
                    <xsl:when test="./i6:value = '2977'">Oman</xsl:when>
                    <xsl:when test="./i6:value = '2984'">Pakistan</xsl:when>
                    <xsl:when test="./i6:value = '2985'">Palau</xsl:when>
                    <xsl:when test="./i6:value = '2986'">Palestine, State of</xsl:when>
                    <xsl:when test="./i6:value = '2987'">Panama</xsl:when>
                    <xsl:when test="./i6:value = '2988'">Papua New Guinea</xsl:when>
                    <xsl:when test="./i6:value = '2989'">Paraguay</xsl:when>
                    <xsl:when test="./i6:value = '2994'">Peru</xsl:when>
                    <xsl:when test="./i6:value = '2995'">Philippines (the)</xsl:when>
                    <xsl:when test="./i6:value = '3000'">Pitcairn</xsl:when>
                    <xsl:when test="./i6:value = '1394'">Poland</xsl:when>
                    <xsl:when test="./i6:value = '1401'">Portugal</xsl:when>
                    <xsl:when test="./i6:value = '3027'">Puerto Rico</xsl:when>
                    <xsl:when test="./i6:value = '3028'">Qatar</xsl:when>
                    <xsl:when test="./i6:value = '1496'">Romania</xsl:when>
                    <xsl:when test="./i6:value = '3175'">Russian Federation (the)</xsl:when>
                    <xsl:when test="./i6:value = '3176'">Rwanda</xsl:when>
                    <xsl:when test="./i6:value = '3177'">Réunion</xsl:when>
                    <xsl:when test="./i6:value = '7823'">Saint Barthélemy</xsl:when>
                    <xsl:when test="./i6:value = '3318'">Saint Helena, Ascension and Tristan da Cunha</xsl:when>
                    <xsl:when test="./i6:value = '3319'">Saint Kitts and Nevis</xsl:when>
                    <xsl:when test="./i6:value = '3320'">Saint Lucia</xsl:when>
                    <xsl:when test="./i6:value = '7824'">Saint Martin (French part)</xsl:when>
                    <xsl:when test="./i6:value = '3321'">Saint Pierre and Miquelon</xsl:when>
                    <xsl:when test="./i6:value = '3322'">Saint Vincent and the Grenadines</xsl:when>
                    <xsl:when test="./i6:value = '3323'">Samoa</xsl:when>
                    <xsl:when test="./i6:value = '3324'">San Marino</xsl:when>
                    <xsl:when test="./i6:value = '3325'">Sao Tome and Principe</xsl:when>
                    <xsl:when test="./i6:value = '3326'">Saudi Arabia</xsl:when>
                    <xsl:when test="./i6:value = '3328'">Senegal</xsl:when>
                    <xsl:when test="./i6:value = '3332'">Serbia</xsl:when>
                    <xsl:when test="./i6:value = '3333'">Seychelles</xsl:when>
                    <xsl:when test="./i6:value = '3336'">Sierra Leone</xsl:when>
                    <xsl:when test="./i6:value = '3337'">Singapore</xsl:when>
                    <xsl:when test="./i6:value = '65602'">Sint Maarten (Dutch part)</xsl:when>
                    <xsl:when test="./i6:value = '3339'">Slovakia</xsl:when>
                    <xsl:when test="./i6:value = '1562'">Slovenia</xsl:when>
                    <xsl:when test="./i6:value = '3340'">Solomon Islands</xsl:when>
                    <xsl:when test="./i6:value = '3343'">Somalia</xsl:when>
                    <xsl:when test="./i6:value = '3344'">South Africa</xsl:when>
                    <xsl:when test="./i6:value = '3345'">South Georgia and the South Sandwich Islands</xsl:when>
                    <xsl:when test="./i6:value = '65603'">South Sudan</xsl:when>
                    <xsl:when test="./i6:value = '1567'">Spain</xsl:when>
                    <xsl:when test="./i6:value = '3346'">Sri Lanka</xsl:when>
                    <xsl:when test="./i6:value = '3352'">Sudan (the)</xsl:when>
                    <xsl:when test="./i6:value = '3355'">Suriname</xsl:when>
                    <xsl:when test="./i6:value = '3357'">Svalbard and Jan Mayen</xsl:when>
                    <xsl:when test="./i6:value = '1591'">Sweden</xsl:when>
                    <xsl:when test="./i6:value = '1595'">Switzerland</xsl:when>
                    <xsl:when test="./i6:value = '3359'">Syrian Arab Republic (the)</xsl:when>
                    <xsl:when test="./i6:value = '3362'">Taiwan</xsl:when>
                    <xsl:when test="./i6:value = '3363'">Tajikistan</xsl:when>
                    <xsl:when test="./i6:value = '3364'">Tanzania, the United Republic of</xsl:when>
                    <xsl:when test="./i6:value = '3366'">Thailand</xsl:when>
                    <xsl:when test="./i6:value = '3370'">Timor-Leste</xsl:when>
                    <xsl:when test="./i6:value = '3371'">Togo</xsl:when>
                    <xsl:when test="./i6:value = '3372'">Tokelau</xsl:when>
                    <xsl:when test="./i6:value = '3373'">Tonga</xsl:when>
                    <xsl:when test="./i6:value = '3393'">Trinidad and Tobago</xsl:when>
                    <xsl:when test="./i6:value = '3394'">Tunisia</xsl:when>
                    <xsl:when test="./i6:value = '1641'">Turkey</xsl:when>
                    <xsl:when test="./i6:value = '3395'">Turkmenistan</xsl:when>
                    <xsl:when test="./i6:value = '3396'">Turks and Caicos Islands (the)</xsl:when>
                    <xsl:when test="./i6:value = '3397'">Tuvalu</xsl:when>
                    <xsl:when test="./i6:value = '3402'">Uganda</xsl:when>
                    <xsl:when test="./i6:value = '3403'">Ukraine</xsl:when>
                    <xsl:when test="./i6:value = '3406'">United Arab Emirates (the)</xsl:when>
                    <xsl:when test="./i6:value = '1651'">United Kingdom of Great Britain and Northern Ireland (the)</xsl:when>
                    <xsl:when test="./i6:value = '63145'">United Kingdom: Northern Ireland</xsl:when>
                    <xsl:when test="./i6:value = '1652'">United States (the)</xsl:when>
                    <xsl:when test="./i6:value = '3407'">United States Minor Outlying Islands (the)</xsl:when>
                    <xsl:when test="./i6:value = '3410'">Uruguay</xsl:when>
                    <xsl:when test="./i6:value = '3412'">Uzbekistan</xsl:when>
                    <xsl:when test="./i6:value = '3414'">Vanuatu</xsl:when>
                    <xsl:when test="./i6:value = '3416'">Venezuela (Bolivarian Republic of)</xsl:when>
                    <xsl:when test="./i6:value = '3420'">Viet Nam</xsl:when>
                    <xsl:when test="./i6:value = '3421'">Virgin Islands (British)</xsl:when>
                    <xsl:when test="./i6:value = '3422'">Virgin Islands (U.S.)</xsl:when>
                    <xsl:when test="./i6:value = '3425'">Wallis And Futuna</xsl:when>
                    <xsl:when test="./i6:value = '3428'">Western Sahara</xsl:when>
                    <xsl:when test="./i6:value = '3433'">Yemen</xsl:when>
                    <xsl:when test="./i6:value = '3434'">Zambia</xsl:when>
                    <xsl:when test="./i6:value = '3435'">Zimbabwe</xsl:when>
                    <xsl:when test="./i6:value = '3446'">Åland Islands</xsl:when>
                    <xsl:when test="./i6:value = '1173'">no data</xsl:when>
                    <xsl:when test="./i6:value = '2207'">not specified</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:NameType | //xt:Relation | //xt:Composition | //xt:Origin">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'Origin'">Origin</xsl:when>
                    <xsl:when test="name(.) = 'Relation'">Relation</xsl:when>
                    <xsl:when test="name(.) = 'Composition'">Type of substance</xsl:when>
                    <xsl:when test="name(.) = 'NameType'">Identifier</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '65560'">BAS number</xsl:when>
                    <xsl:when test="./i6:value = '4174'">CAS name</xsl:when>
                    <xsl:when test="./i6:value = '4175'">CAS number</xsl:when>
                    <xsl:when test="./i6:value = '129851'">CIPAC code</xsl:when>
                    <xsl:when test="./i6:value = '9167'">CLP alternative name</xsl:when>
                    <xsl:when test="./i6:value = '55444'">CLP index number - harmonised C&amp;L</xsl:when>
                    <xsl:when test="./i6:value = '2757'">Colour Index</xsl:when>
                    <xsl:when test="./i6:value = '65196'">collection and culture reference number</xsl:when>
                    <xsl:when test="./i6:value = '4176'">common name</xsl:when>
                    <xsl:when test="./i6:value = '60821'">E number</xsl:when>
                    <xsl:when test="./i6:value = '4177'">EC name</xsl:when>
                    <xsl:when test="./i6:value = '4178'">EC number</xsl:when>
                    <xsl:when test="./i6:value = '2812'">FEMA number</xsl:when>
                    <xsl:when test="./i6:value = '129303'">fuels</xsl:when>
                    <xsl:when test="./i6:value = '60822'">INCI name</xsl:when>
                    <xsl:when test="./i6:value = '2860'">ISO name</xsl:when>
                    <xsl:when test="./i6:value = '108038'">standard formula (SF)</xsl:when>
                    <xsl:when test="./i6:value = '3398'">UN name/number</xsl:when>
                    <xsl:when test="./i6:value = '65195'">taxonomic name and strain</xsl:when>
                    <xsl:when test="./i6:value = '9168'">trade name</xsl:when>
                    <xsl:when test="./i6:value = '65197'">wild type / mutant / genetically modified</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                    <xsl:when test="./i6:value = '60856'">previously considered as</xsl:when>
                    <xsl:when test="./i6:value = '60857'">used in other regulatory scheme</xsl:when>
                    <xsl:when test="./i6:value = '2915'">mono-constituent substance</xsl:when>
                    <xsl:when test="./i6:value = '2923'">multi-constituent substance</xsl:when>
                    <xsl:when test="./i6:value = '3401'">UVCB</xsl:when>
                    <xsl:when test="./i6:value = '3001'">polymer</xsl:when>
                    <xsl:when test="./i6:value = '62413'">microorganism or toxin produced by a microorganism</xsl:when>
                    <xsl:when test="./i6:value = '1756'">element</xsl:when>
                    <xsl:when test="./i6:value = '2003'">inorganic</xsl:when>
                    <xsl:when test="./i6:value = '1334'">organic</xsl:when>
                    <xsl:when test="./i6:value = '2240'">organometallic</xsl:when>
                    <xsl:when test="./i6:value = '2262'">petroleum product</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:OtherNames | //xt:ContactPersons">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'ContactPersons'">Contact persons</xsl:when>
                    <xsl:when test="name(.) = 'OtherNames'">Other substance identifiers</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:ReferenceSubstance | //xt:TypeOfSubstance | //xt:RoleInSupplyChain">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'TypeOfSubstance'">Type of substance</xsl:when>
                    <xsl:when test="name(.) = 'RoleInSupplyChain'">Role in the supply chain</xsl:when>
                    <xsl:when test="name(.) = 'ReferenceSubstance'">Identification of substance</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:ChemicalName | //xt:PublicName | //xt:Name">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'PublicName'">Public name</xsl:when>
                    <xsl:when test="name(.) = 'ChemicalName'">Substance name</xsl:when>
                    <xsl:when test="name(.) = 'Name'">Identity</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Remarks">
        <tr>
            <td class="label">Remarks</td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//i6:country/i6:value">
        <xsl:choose>
            <xsl:when test=". = '2683'">Afghanistan </xsl:when>
            <xsl:when test=". = '2684'">Albania </xsl:when>
            <xsl:when test=". = '2685'">Algeria </xsl:when>
            <xsl:when test=". = '2686'">American Samoa </xsl:when>
            <xsl:when test=". = '2688'">Andorra </xsl:when>
            <xsl:when test=". = '2689'">Angola </xsl:when>
            <xsl:when test=". = '2690'">Anguilla </xsl:when>
            <xsl:when test=". = '2692'">Antarctica </xsl:when>
            <xsl:when test=". = '2695'">Antigua and Barbuda </xsl:when>
            <xsl:when test=". = '2696'">Argentina </xsl:when>
            <xsl:when test=". = '2697'">Armenia </xsl:when>
            <xsl:when test=". = '2698'">Aruba </xsl:when>
            <xsl:when test=". = '107'">Australia </xsl:when>
            <xsl:when test=". = '108'">Austria </xsl:when>
            <xsl:when test=". = '2701'">Azerbaijan </xsl:when>
            <xsl:when test=". = '2702'">Bahamas (the) </xsl:when>
            <xsl:when test=". = '2703'">Bahrain </xsl:when>
            <xsl:when test=". = '2704'">Bangladesh </xsl:when>
            <xsl:when test=". = '2705'">Barbados </xsl:when>
            <xsl:when test=". = '2707'">Belarus </xsl:when>
            <xsl:when test=". = '147'">Belgium </xsl:when>
            <xsl:when test=". = '2708'">Belize </xsl:when>
            <xsl:when test=". = '2709'">Benin </xsl:when>
            <xsl:when test=". = '2710'">Bermuda </xsl:when>
            <xsl:when test=". = '2711'">Bhutan </xsl:when>
            <xsl:when test=". = '2720'">Bolivia (Plurinational State of) </xsl:when>
            <xsl:when test=". = '65600'">Bonaire, Sint Eustatius and Saba </xsl:when>
            <xsl:when test=". = '2722'">Bosnia and Herzegovina </xsl:when>
            <xsl:when test=". = '2723'">Botswana </xsl:when>
            <xsl:when test=". = '2724'">Bouvet Island </xsl:when>
            <xsl:when test=". = '2725'">Brazil </xsl:when>
            <xsl:when test=". = '2726'">British Indian Ocean Territory (the) </xsl:when>
            <xsl:when test=". = '2727'">Brunei Darussalam </xsl:when>
            <xsl:when test=". = '184'">Bulgaria </xsl:when>
            <xsl:when test=". = '2729'">Burkina Faso </xsl:when>
            <xsl:when test=". = '2730'">Burundi </xsl:when>
            <xsl:when test=". = '2736'">Cabo Verde </xsl:when>
            <xsl:when test=". = '2734'">Cambodia </xsl:when>
            <xsl:when test=". = '2735'">Cameroon </xsl:when>
            <xsl:when test=". = '206'">Canada </xsl:when>
            <xsl:when test=". = '2746'">Cayman Islands (the) </xsl:when>
            <xsl:when test=". = '2747'">Central African Republic (the) </xsl:when>
            <xsl:when test=". = '2748'">Chad </xsl:when>
            <xsl:when test=". = '2749'">Chile </xsl:when>
            <xsl:when test=". = '2750'">China </xsl:when>
            <xsl:when test=". = '2751'">Christmas Island </xsl:when>
            <xsl:when test=". = '2754'">Cocos (Keeling) Islands (the) </xsl:when>
            <xsl:when test=". = '2755'">Colombia </xsl:when>
            <xsl:when test=". = '2759'">Comoros (the) </xsl:when>
            <xsl:when test=". = '2765'">Congo (the Democratic Republic of the) </xsl:when>
            <xsl:when test=". = '2764'">Congo (the) </xsl:when>
            <xsl:when test=". = '2769'">Cook Islands (the) </xsl:when>
            <xsl:when test=". = '2771'">Costa Rica </xsl:when>
            <xsl:when test=". = '286'">Croatia </xsl:when>
            <xsl:when test=". = '2773'">Cuba </xsl:when>
            <xsl:when test=". = '65601'">Curaçao </xsl:when>
            <xsl:when test=". = '304'">Cyprus </xsl:when>
            <xsl:when test=". = '307'">Czechia </xsl:when>
            <xsl:when test=". = '2774'">Côte d'Ivoire </xsl:when>
            <xsl:when test=". = '333'">Denmark </xsl:when>
            <xsl:when test=". = '2790'">Djibouti </xsl:when>
            <xsl:when test=". = '2791'">Dominica </xsl:when>
            <xsl:when test=". = '2792'">Dominican Republic (the) </xsl:when>
            <xsl:when test=". = '2799'">Ecuador </xsl:when>
            <xsl:when test=". = '2800'">Egypt </xsl:when>
            <xsl:when test=". = '2801'">El Salvador </xsl:when>
            <xsl:when test=". = '2803'">Equatorial Guinea </xsl:when>
            <xsl:when test=". = '2804'">Eritrea </xsl:when>
            <xsl:when test=". = '754'">Estonia </xsl:when>
            <xsl:when test=". = '3358'">Eswatini </xsl:when>
            <xsl:when test=". = '2805'">Ethiopia </xsl:when>
            <xsl:when test=". = '2813'">Falkland Islands (the) [Malvinas] </xsl:when>
            <xsl:when test=". = '2815'">Faroe Islands (the) </xsl:when>
            <xsl:when test=". = '2817'">Fiji </xsl:when>
            <xsl:when test=". = '766'">Finland </xsl:when>
            <xsl:when test=". = '779'">France </xsl:when>
            <xsl:when test=". = '2825'">French Guiana </xsl:when>
            <xsl:when test=". = '2826'">French Polynesia </xsl:when>
            <xsl:when test=". = '2827'">French Southern Territories (the) </xsl:when>
            <xsl:when test=". = '2828'">Gabon </xsl:when>
            <xsl:when test=". = '2829'">Gambia (the) </xsl:when>
            <xsl:when test=". = '2834'">Georgia </xsl:when>
            <xsl:when test=". = '807'">Germany </xsl:when>
            <xsl:when test=". = '2835'">Ghana </xsl:when>
            <xsl:when test=". = '2836'">Gibraltar </xsl:when>
            <xsl:when test=". = '810'">Greece </xsl:when>
            <xsl:when test=". = '2838'">Greenland </xsl:when>
            <xsl:when test=". = '2839'">Grenada </xsl:when>
            <xsl:when test=". = '2840'">Guadeloupe </xsl:when>
            <xsl:when test=". = '2841'">Guam </xsl:when>
            <xsl:when test=". = '2842'">Guatemala </xsl:when>
            <xsl:when test=". = '7818'">Guernsey </xsl:when>
            <xsl:when test=". = '2843'">Guinea </xsl:when>
            <xsl:when test=". = '2844'">Guinea-Bissau </xsl:when>
            <xsl:when test=". = '2845'">Guyana </xsl:when>
            <xsl:when test=". = '2846'">Haiti </xsl:when>
            <xsl:when test=". = '2851'">Heard Island and McDonald Islands </xsl:when>
            <xsl:when test=". = '2854'">Holy See (the) </xsl:when>
            <xsl:when test=". = '2855'">Honduras </xsl:when>
            <xsl:when test=". = '2856'">Hong Kong </xsl:when>
            <xsl:when test=". = '845'">Hungary </xsl:when>
            <xsl:when test=". = '882'">Iceland </xsl:when>
            <xsl:when test=". = '2865'">India </xsl:when>
            <xsl:when test=". = '2866'">Indonesia </xsl:when>
            <xsl:when test=". = '2870'">Iran (Islamic Republic of) </xsl:when>
            <xsl:when test=". = '2871'">Iraq </xsl:when>
            <xsl:when test=". = '911'">Ireland </xsl:when>
            <xsl:when test=". = '7819'">Isle of Man </xsl:when>
            <xsl:when test=". = '2876'">Israel </xsl:when>
            <xsl:when test=". = '916'">Italy </xsl:when>
            <xsl:when test=". = '2877'">Jamaica </xsl:when>
            <xsl:when test=". = '918'">Japan </xsl:when>
            <xsl:when test=". = '7820'">Jersey </xsl:when>
            <xsl:when test=". = '2878'">Jordan </xsl:when>
            <xsl:when test=". = '2879'">Kazakhstan </xsl:when>
            <xsl:when test=". = '2880'">Kenya </xsl:when>
            <xsl:when test=". = '2881'">Kiribati </xsl:when>
            <xsl:when test=". = '2882'">Korea (the Democratic People's Republic of) </xsl:when>
            <xsl:when test=". = '2883'">Korea (the Republic of) </xsl:when>
            <xsl:when test=". = '2884'">Kuwait </xsl:when>
            <xsl:when test=". = '2885'">Kyrgyzstan </xsl:when>
            <xsl:when test=". = '2886'">Lao People's Democratic Republic (the) </xsl:when>
            <xsl:when test=". = '985'">Latvia </xsl:when>
            <xsl:when test=". = '2887'">Lebanon </xsl:when>
            <xsl:when test=". = '2888'">Lesotho </xsl:when>
            <xsl:when test=". = '2889'">Liberia </xsl:when>
            <xsl:when test=". = '2890'">Libya </xsl:when>
            <xsl:when test=". = '2891'">Liechtenstein </xsl:when>
            <xsl:when test=". = '1024'">Lithuania </xsl:when>
            <xsl:when test=". = '1041'">Luxembourg </xsl:when>
            <xsl:when test=". = '2896'">Macao </xsl:when>
            <xsl:when test=". = '2898'">Madagascar </xsl:when>
            <xsl:when test=". = '2899'">Malawi </xsl:when>
            <xsl:when test=". = '2900'">Malaysia </xsl:when>
            <xsl:when test=". = '2901'">Maldives </xsl:when>
            <xsl:when test=". = '2902'">Mali </xsl:when>
            <xsl:when test=". = '1048'">Malta </xsl:when>
            <xsl:when test=". = '2904'">Marshall Islands (the) </xsl:when>
            <xsl:when test=". = '2905'">Martinique </xsl:when>
            <xsl:when test=". = '2908'">Mauritania </xsl:when>
            <xsl:when test=". = '2909'">Mauritius </xsl:when>
            <xsl:when test=". = '2910'">Mayotte </xsl:when>
            <xsl:when test=". = '1067'">Mexico </xsl:when>
            <xsl:when test=". = '3877'">Micronesia (Federated States of) </xsl:when>
            <xsl:when test=". = '2919'">Moldova (the Republic of) </xsl:when>
            <xsl:when test=". = '2921'">Monaco </xsl:when>
            <xsl:when test=". = '2922'">Mongolia </xsl:when>
            <xsl:when test=". = '7821'">Montenegro </xsl:when>
            <xsl:when test=". = '2924'">Montserrat </xsl:when>
            <xsl:when test=". = '2925'">Morocco </xsl:when>
            <xsl:when test=". = '2926'">Mozambique </xsl:when>
            <xsl:when test=". = '2930'">Myanmar </xsl:when>
            <xsl:when test=". = '2932'">Namibia </xsl:when>
            <xsl:when test=". = '2933'">Nauru </xsl:when>
            <xsl:when test=". = '2934'">Nepal </xsl:when>
            <xsl:when test=". = '1158'">Netherlands (the) </xsl:when>
            <xsl:when test=". = '2935'">Netherlands Antilles </xsl:when>
            <xsl:when test=". = '2938'">New Caledonia </xsl:when>
            <xsl:when test=". = '1161'">New Zealand </xsl:when>
            <xsl:when test=". = '2939'">Nicaragua </xsl:when>
            <xsl:when test=". = '2940'">Niger (the) </xsl:when>
            <xsl:when test=". = '2941'">Nigeria </xsl:when>
            <xsl:when test=". = '2942'">Niue </xsl:when>
            <xsl:when test=". = '2945'">Norfolk Island </xsl:when>
            <xsl:when test=". = '2897'">North Macedonia </xsl:when>
            <xsl:when test=". = '2946'">Northern Mariana Islands (the) </xsl:when>
            <xsl:when test=". = '1175'">Norway </xsl:when>
            <xsl:when test=". = '2977'">Oman </xsl:when>
            <xsl:when test=". = '2984'">Pakistan </xsl:when>
            <xsl:when test=". = '2985'">Palau </xsl:when>
            <xsl:when test=". = '2986'">Palestine, State of </xsl:when>
            <xsl:when test=". = '2987'">Panama </xsl:when>
            <xsl:when test=". = '2988'">Papua New Guinea </xsl:when>
            <xsl:when test=". = '2989'">Paraguay </xsl:when>
            <xsl:when test=". = '2994'">Peru </xsl:when>
            <xsl:when test=". = '2995'">Philippines (the) </xsl:when>
            <xsl:when test=". = '3000'">Pitcairn </xsl:when>
            <xsl:when test=". = '1394'">Poland </xsl:when>
            <xsl:when test=". = '1401'">Portugal </xsl:when>
            <xsl:when test=". = '3027'">Puerto Rico </xsl:when>
            <xsl:when test=". = '3028'">Qatar </xsl:when>
            <xsl:when test=". = '1496'">Romania </xsl:when>
            <xsl:when test=". = '3175'">Russian Federation (the) </xsl:when>
            <xsl:when test=". = '3176'">Rwanda </xsl:when>
            <xsl:when test=". = '3177'">Réunion </xsl:when>
            <xsl:when test=". = '7823'">Saint Barthélemy </xsl:when>
            <xsl:when test=". = '3318'">Saint Helena, Ascension and Tristan da Cunha </xsl:when>
            <xsl:when test=". = '3319'">Saint Kitts and Nevis </xsl:when>
            <xsl:when test=". = '3320'">Saint Lucia </xsl:when>
            <xsl:when test=". = '7824'">Saint Martin (French part) </xsl:when>
            <xsl:when test=". = '3321'">Saint Pierre and Miquelon </xsl:when>
            <xsl:when test=". = '3322'">Saint Vincent and the Grenadines </xsl:when>
            <xsl:when test=". = '3323'">Samoa </xsl:when>
            <xsl:when test=". = '3324'">San Marino </xsl:when>
            <xsl:when test=". = '3325'">Sao Tome and Principe </xsl:when>
            <xsl:when test=". = '3326'">Saudi Arabia </xsl:when>
            <xsl:when test=". = '3328'">Senegal </xsl:when>
            <xsl:when test=". = '3332'">Serbia </xsl:when>
            <xsl:when test=". = '3333'">Seychelles </xsl:when>
            <xsl:when test=". = '3336'">Sierra Leone </xsl:when>
            <xsl:when test=". = '3337'">Singapore </xsl:when>
            <xsl:when test=". = '65602'">Sint Maarten (Dutch part) </xsl:when>
            <xsl:when test=". = '3339'">Slovakia </xsl:when>
            <xsl:when test=". = '1562'">Slovenia </xsl:when>
            <xsl:when test=". = '3340'">Solomon Islands </xsl:when>
            <xsl:when test=". = '3343'">Somalia </xsl:when>
            <xsl:when test=". = '3344'">South Africa </xsl:when>
            <xsl:when test=". = '3345'">South Georgia and the South Sandwich Islands </xsl:when>
            <xsl:when test=". = '65603'">South Sudan </xsl:when>
            <xsl:when test=". = '1567'">Spain </xsl:when>
            <xsl:when test=". = '3346'">Sri Lanka </xsl:when>
            <xsl:when test=". = '3352'">Sudan (the) </xsl:when>
            <xsl:when test=". = '3355'">Suriname </xsl:when>
            <xsl:when test=". = '3357'">Svalbard and Jan Mayen </xsl:when>
            <xsl:when test=". = '1591'">Sweden </xsl:when>
            <xsl:when test=". = '1595'">Switzerland </xsl:when>
            <xsl:when test=". = '3359'">Syrian Arab Republic (the) </xsl:when>
            <xsl:when test=". = '3362'">Taiwan </xsl:when>
            <xsl:when test=". = '3363'">Tajikistan </xsl:when>
            <xsl:when test=". = '3364'">Tanzania, the United Republic of </xsl:when>
            <xsl:when test=". = '3366'">Thailand </xsl:when>
            <xsl:when test=". = '3370'">Timor-Leste </xsl:when>
            <xsl:when test=". = '3371'">Togo </xsl:when>
            <xsl:when test=". = '3372'">Tokelau </xsl:when>
            <xsl:when test=". = '3373'">Tonga </xsl:when>
            <xsl:when test=". = '3393'">Trinidad and Tobago </xsl:when>
            <xsl:when test=". = '3394'">Tunisia </xsl:when>
            <xsl:when test=". = '1641'">Turkey </xsl:when>
            <xsl:when test=". = '3395'">Turkmenistan </xsl:when>
            <xsl:when test=". = '3396'">Turks and Caicos Islands (the) </xsl:when>
            <xsl:when test=". = '3397'">Tuvalu </xsl:when>
            <xsl:when test=". = '3402'">Uganda </xsl:when>
            <xsl:when test=". = '3403'">Ukraine </xsl:when>
            <xsl:when test=". = '3406'">United Arab Emirates (the) </xsl:when>
            <xsl:when test=". = '1651'">United Kingdom of Great Britain and Northern Ireland (the) </xsl:when>
            <xsl:when test=". = '63145'">United Kingdom: Northern Ireland </xsl:when>
            <xsl:when test=". = '1652'">United States (the) </xsl:when>
            <xsl:when test=". = '3407'">United States Minor Outlying Islands (the) </xsl:when>
            <xsl:when test=". = '3410'">Uruguay </xsl:when>
            <xsl:when test=". = '3412'">Uzbekistan </xsl:when>
            <xsl:when test=". = '3414'">Vanuatu </xsl:when>
            <xsl:when test=". = '3416'">Venezuela (Bolivarian Republic of) </xsl:when>
            <xsl:when test=". = '3420'">Viet Nam </xsl:when>
            <xsl:when test=". = '3421'">Virgin Islands (British) </xsl:when>
            <xsl:when test=". = '3422'">Virgin Islands (U.S.) </xsl:when>
            <xsl:when test=". = '3425'">Wallis And Futuna </xsl:when>
            <xsl:when test=". = '3428'">Western Sahara </xsl:when>
            <xsl:when test=". = '3433'">Yemen </xsl:when>
            <xsl:when test=". = '3434'">Zambia </xsl:when>
            <xsl:when test=". = '3435'">Zimbabwe </xsl:when>
            <xsl:when test=". = '3446'">Åland Islands </xsl:when>
            <xsl:when test=". = '1173'">no data </xsl:when>
            <xsl:when test=". = '2207'">not specified </xsl:when>
            <xsl:when test=". = '1342'">other: </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="//xt:DataProtection/i6:confidentiality">
        <xsl:choose>
            <xsl:when test=". = '2732'">CBI </xsl:when>
            <xsl:when test=". = '2859'">IP </xsl:when>
            <xsl:when test=". = '3441'">no PA </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
