<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-Explosiveness/7.0" version="1.0">
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
    <xsl:template match="//xt:ENDPOINT_STUDY_RECORD">
        <tr class="headerDocument">
            <td>Explosiveness</td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:RobustStudy | //xt:UsedForClassification | //xt:UsedForMSDS | //xt:KeyResult | //xt:KeyResult">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'RobustStudy'">Robust study summary</xsl:when>
                    <xsl:when test="name(.) = 'UsedForMSDS'">Used for SDS</xsl:when>
                    <xsl:when test="name(.) = 'UsedForClassification'">Used for classification</xsl:when>
                    <xsl:when test="name(.) = 'KeyResult'">Key result</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataProtection">
        <tr>
            <td class="label"/>
            <td class="value">
                <xsl:apply-templates/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:RelatedInformation | //xt:TestMaterialInformation">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'RelatedInformation'">Related information</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterialInformation'">Test material information</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Value | //xt:NumberOfFragments | //xt:Value">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'Value'">Value</xsl:when>
                    <xsl:when test="name(.) = 'NumberOfFragments'">Number of fragments</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataWaivingJustification">
        <tr>
            <td class="label">Justification for data waiving</td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '60481'">the study does not need to be conducted because there are no chemical groups present in the molecule which are associated with explosive properties</xsl:when>
                    <xsl:when test="./i6:value = '60483'">the study does not need to be conducted because the substance contains chemical groups associated with explosive properties which include oxygen, but the calculated oxygen balance is less than - 200</xsl:when>
                    <xsl:when test="./i6:value = '61926'">the study does not need to be conducted because the substance is an organic substance or mixture containing chemical groups associated with explosive properties, but the exothermic decomposition energy is less than 500 J/g and the onset of exothermic decomposition is below 500°C</xsl:when>
                    <xsl:when test="./i6:value = '61899'">the study does not need to be conducted because the substance is a gas</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Endpoint | //xt:StudyResultType | //xt:PurposeFlag | //xt:Reliability | //xt:RationalReliability | //xt:DataWaiving | //xt:ReasonPurpose | //xt:ReasonPurpose | //xt:DataAccess | //xt:DataProtectionClaimed | //xt:Qualifier | //xt:Guideline | //xt:Deviation | //xt:GLPComplianceStatement | //xt:OtherQualityAssurance | //xt:Parameter | //xt:RemarksOnResults | //xt:TestSeries | //xt:Method | //xt:Parameter | //xt:Results | //xt:RemarksOnResults | //xt:Type | //xt:InterpretationOfResults">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'OtherQualityAssurance'">Other quality assurance</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Guideline</xsl:when>
                    <xsl:when test="name(.) = 'DataWaiving'">Data waiving</xsl:when>
                    <xsl:when test="name(.) = 'Method'">Method</xsl:when>
                    <xsl:when test="name(.) = 'PurposeFlag'">Adequacy of study</xsl:when>
                    <xsl:when test="name(.) = 'ReasonPurpose'">Reason / purpose for cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'DataAccess'">Data access</xsl:when>
                    <xsl:when test="name(.) = 'GLPComplianceStatement'">GLP compliance</xsl:when>
                    <xsl:when test="name(.) = 'TestSeries'">Test series</xsl:when>
                    <xsl:when test="name(.) = 'Type'">Type</xsl:when>
                    <xsl:when test="name(.) = 'Endpoint'">Endpoint</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Remarks on result</xsl:when>
                    <xsl:when test="name(.) = 'Results'">Result</xsl:when>
                    <xsl:when test="name(.) = 'RationalReliability'">Rationale for reliability incl. deficiencies</xsl:when>
                    <xsl:when test="name(.) = 'Parameter'">Parameter</xsl:when>
                    <xsl:when test="name(.) = 'DataProtectionClaimed'">Data protection claimed</xsl:when>
                    <xsl:when test="name(.) = 'Qualifier'">Qualifier</xsl:when>
                    <xsl:when test="name(.) = 'Reliability'">Reliability</xsl:when>
                    <xsl:when test="name(.) = 'Deviation'">Deviations</xsl:when>
                    <xsl:when test="name(.) = 'InterpretationOfResults'">Interpretation of results</xsl:when>
                    <xsl:when test="name(.) = 'StudyResultType'">Type of information</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '60479'">explosive properties of explosives</xsl:when>
                    <xsl:when test="./i6:value = '60480'">explosiveness, other</xsl:when>
                    <xsl:when test="./i6:value = '61992'">explosiveness</xsl:when>
                    <xsl:when test="./i6:value = '1895'">experimental study</xsl:when>
                    <xsl:when test="./i6:value = '1896'">experimental study planned</xsl:when>
                    <xsl:when test="./i6:value = '60002'">experimental study planned (based on read-across)</xsl:when>
                    <xsl:when test="./i6:value = '14'">(Q)SAR</xsl:when>
                    <xsl:when test="./i6:value = '1885'">calculation (if not (Q)SAR)</xsl:when>
                    <xsl:when test="./i6:value = '2303'">read-across based on grouping of substances (category approach)</xsl:when>
                    <xsl:when test="./i6:value = '62036'">migrated information: read-across based on grouping of substances (category approach)</xsl:when>
                    <xsl:when test="./i6:value = '2304'">read-across from supporting substance (structural analogue or surrogate)</xsl:when>
                    <xsl:when test="./i6:value = '107831'">mixture rules calculation</xsl:when>
                    <xsl:when test="./i6:value = '107832'">read-across from similar mixture/product</xsl:when>
                    <xsl:when test="./i6:value = '62035'">migrated information: read-across from supporting substance (structural analogue or surrogate)</xsl:when>
                    <xsl:when test="./i6:value = '2207'">not specified</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                    <xsl:when test="./i6:value = '1173'">no data</xsl:when>
                    <xsl:when test="./i6:value = '921'">key study</xsl:when>
                    <xsl:when test="./i6:value = '1590'">supporting study</xsl:when>
                    <xsl:when test="./i6:value = '1661'">weight of evidence</xsl:when>
                    <xsl:when test="./i6:value = '8108'">disregarded due to major methodological deficiencies</xsl:when>
                    <xsl:when test="./i6:value = '60020'">other information</xsl:when>
                    <xsl:when test="./i6:value = '16'">1 (reliable without restriction)</xsl:when>
                    <xsl:when test="./i6:value = '18'">2 (reliable with restrictions)</xsl:when>
                    <xsl:when test="./i6:value = '22'">3 (not reliable)</xsl:when>
                    <xsl:when test="./i6:value = '24'">4 (not assignable)</xsl:when>
                    <xsl:when test="./i6:value = '60170'">guideline study</xsl:when>
                    <xsl:when test="./i6:value = '60171'">comparable to guideline study</xsl:when>
                    <xsl:when test="./i6:value = '60172'">test procedure in accordance with national standard methods</xsl:when>
                    <xsl:when test="./i6:value = '60173'">test procedure in accordance with generally accepted scientific standards and described in sufficient detail</xsl:when>
                    <xsl:when test="./i6:value = '60174'">guideline study without detailed documentation</xsl:when>
                    <xsl:when test="./i6:value = '60175'">guideline study with acceptable restrictions</xsl:when>
                    <xsl:when test="./i6:value = '60176'">comparable to guideline study with acceptable restrictions</xsl:when>
                    <xsl:when test="./i6:value = '60177'">test procedure in accordance with national standard methods with acceptable restrictions</xsl:when>
                    <xsl:when test="./i6:value = '60178'">study well documented, meets generally accepted scientific principles, acceptable for assessment</xsl:when>
                    <xsl:when test="./i6:value = '60179'">accepted calculation method</xsl:when>
                    <xsl:when test="./i6:value = '60180'">data from handbook or collection of data</xsl:when>
                    <xsl:when test="./i6:value = '60181'">significant methodological deficiencies</xsl:when>
                    <xsl:when test="./i6:value = '60182'">unsuitable test system</xsl:when>
                    <xsl:when test="./i6:value = '60183'">abstract</xsl:when>
                    <xsl:when test="./i6:value = '60184'">secondary literature</xsl:when>
                    <xsl:when test="./i6:value = '60185'">documentation insufficient for assessment</xsl:when>
                    <xsl:when test="./i6:value = '60186'">results derived from a valid (Q)SAR model and falling into its applicability domain, with adequate and reliable documentation / justification</xsl:when>
                    <xsl:when test="./i6:value = '60187'">results derived from a valid (Q)SAR model and falling into its applicability domain, with limited documentation / justification</xsl:when>
                    <xsl:when test="./i6:value = '60188'">results derived from a valid (Q)SAR model, but  not (completely) falling into its applicability domain, with adequate and reliable documentation / justification</xsl:when>
                    <xsl:when test="./i6:value = '60189'">results derived from a (Q)SAR model, with limited documentation / justification, but validity of model and reliability of prediction considered adequate based on a generally acknowledged source</xsl:when>
                    <xsl:when test="./i6:value = '60190'">results derived from a valid (Q)SAR model, but not (completely) falling into its applicability domain, and documentation / justification is limited</xsl:when>
                    <xsl:when test="./i6:value = '60191'">results derived from a (Q)SAR model, with limited documentation / justification</xsl:when>
                    <xsl:when test="./i6:value = '1588'">study technically not feasible</xsl:when>
                    <xsl:when test="./i6:value = '1587'">study scientifically not necessary / other information available</xsl:when>
                    <xsl:when test="./i6:value = '982'">exposure considerations</xsl:when>
                    <xsl:when test="./i6:value = '60022'">study waived due to provisions of other regulation</xsl:when>
                    <xsl:when test="./i6:value = '2533'">other justification</xsl:when>
                    <xsl:when test="./i6:value = '60006'">data waiving: supporting information</xsl:when>
                    <xsl:when test="./i6:value = '60007'">exposure-related information</xsl:when>
                    <xsl:when test="./i6:value = '60008'">read-across: supporting information</xsl:when>
                    <xsl:when test="./i6:value = '60009'">(Q)SAR model reporting (QMRF)</xsl:when>
                    <xsl:when test="./i6:value = '60010'">(Q)SAR prediction reporting (QPRF)</xsl:when>
                    <xsl:when test="./i6:value = '60011'">(Q)SAR model and prediction reporting (QMRF/QPRF)</xsl:when>
                    <xsl:when test="./i6:value = '60012'">(Q)SAR: supporting information</xsl:when>
                    <xsl:when test="./i6:value = '60013'">justification, other:</xsl:when>
                    <xsl:when test="./i6:value = '60014'">assessment report</xsl:when>
                    <xsl:when test="./i6:value = '60015'">read-across source</xsl:when>
                    <xsl:when test="./i6:value = '60016'">reference to other assay used for intermediate effect derivation</xsl:when>
                    <xsl:when test="./i6:value = '60017'">reference to same study</xsl:when>
                    <xsl:when test="./i6:value = '60018'">reference to other study</xsl:when>
                    <xsl:when test="./i6:value = '1838'">data submitter is data owner</xsl:when>
                    <xsl:when test="./i6:value = '1837'">data submitter has Letter of Access</xsl:when>
                    <xsl:when test="./i6:value = '1835'">data no longer protected</xsl:when>
                    <xsl:when test="./i6:value = '1836'">data published</xsl:when>
                    <xsl:when test="./i6:value = '60023'">data submitter has permission to refer</xsl:when>
                    <xsl:when test="./i6:value = '2193'">not applicable</xsl:when>
                    <xsl:when test="./i6:value = '2480'">yes</xsl:when>
                    <xsl:when test="./i6:value = '4161'">yes, but willing to share</xsl:when>
                    <xsl:when test="./i6:value = '4162'">yes, but not willing to share</xsl:when>
                    <xsl:when test="./i6:value = '1680'">according to guideline</xsl:when>
                    <xsl:when test="./i6:value = '1880'">equivalent or similar to guideline</xsl:when>
                    <xsl:when test="./i6:value = '2172'">no guideline followed</xsl:when>
                    <xsl:when test="./i6:value = '2171'">no guideline available</xsl:when>
                    <xsl:when test="./i6:value = '2175'">no guideline required</xsl:when>
                    <xsl:when test="./i6:value = '60117'">UN Manual of Tests and Criteria: Part I: Classification procedures, test methods and criteria relating to explosives of Class 1</xsl:when>
                    <xsl:when test="./i6:value = '108019'">UN Manual of Tests and Criteria: Part V: Classification procedures, test methods and criteria relating to the hazard class desensitized explosives</xsl:when>
                    <xsl:when test="./i6:value = '651'">EU Method A.14 (Explosive properties)</xsl:when>
                    <xsl:when test="./i6:value = '4087'">EPA OPPTS 830.6316 (Explodability)</xsl:when>
                    <xsl:when test="./i6:value = '2246'">other guideline:</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '4179'">yes (incl. QA statement)</xsl:when>
                    <xsl:when test="./i6:value = '60005'">ISO/IEC 17025 (General requirements for the competence of testing and calibration laboratories)</xsl:when>
                    <xsl:when test="./i6:value = '60118'">thermal sensitivity - Koenen test: diameter of the orifice plate</xsl:when>
                    <xsl:when test="./i6:value = '60119'">thermal sensitivity - Koenen test: limiting diameter (mm)</xsl:when>
                    <xsl:when test="./i6:value = '60120'">sensitiveness to impact: impact energy (J)</xsl:when>
                    <xsl:when test="./i6:value = '60121'">sensitiveness to friction: friction load (N)</xsl:when>
                    <xsl:when test="./i6:value = '60122'">not thermal sensitive if heated under defined confinement</xsl:when>
                    <xsl:when test="./i6:value = '60123'">not sensitive to impact using an impact energy of 40 J</xsl:when>
                    <xsl:when test="./i6:value = '60124'">not sensitive to friction using a friction load of 360 N</xsl:when>
                    <xsl:when test="./i6:value = '60125'">thermal sensitive if heated under defined confinement</xsl:when>
                    <xsl:when test="./i6:value = '60126'">sensitive to impact</xsl:when>
                    <xsl:when test="./i6:value = '60127'">sensitive to friction</xsl:when>
                    <xsl:when test="./i6:value = '60495'">positive (not further specified)</xsl:when>
                    <xsl:when test="./i6:value = '60496'">negative (not further specified)</xsl:when>
                    <xsl:when test="./i6:value = '60206'">not determinable</xsl:when>
                    <xsl:when test="./i6:value = '60207'">not determinable because of methodological limitations</xsl:when>
                    <xsl:when test="./i6:value = '60208'">not measured/tested</xsl:when>
                    <xsl:when test="./i6:value = '2203'">not required</xsl:when>
                    <xsl:when test="./i6:value = '60128'">UN Test series 1</xsl:when>
                    <xsl:when test="./i6:value = '60129'">UN Test series 2</xsl:when>
                    <xsl:when test="./i6:value = '60130'">UN Test series 3</xsl:when>
                    <xsl:when test="./i6:value = '60131'">UN Test series 4</xsl:when>
                    <xsl:when test="./i6:value = '60132'">UN Test series 5</xsl:when>
                    <xsl:when test="./i6:value = '60133'">UN Test series 6</xsl:when>
                    <xsl:when test="./i6:value = '60134'">UN Test series 7</xsl:when>
                    <xsl:when test="./i6:value = '60135'">UN Test series 8</xsl:when>
                    <xsl:when test="./i6:value = '60497'">test data derived by a competent authority</xsl:when>
                    <xsl:when test="./i6:value = '60498'">UN Test 1 (a): UN gap test</xsl:when>
                    <xsl:when test="./i6:value = '60499'">UN Test 1 (b): Koenen test</xsl:when>
                    <xsl:when test="./i6:value = '60500'">UN Test 1 (c) (i): Time/pressure test</xsl:when>
                    <xsl:when test="./i6:value = '60501'">UN Test 1 (c) (ii): Internal ignition test</xsl:when>
                    <xsl:when test="./i6:value = '60502'">UN Test 2 (a): UN gap test</xsl:when>
                    <xsl:when test="./i6:value = '60503'">UN Test 2 (b): Koenen test</xsl:when>
                    <xsl:when test="./i6:value = '60504'">UN Test 2 (c) (i): Time/pressure test</xsl:when>
                    <xsl:when test="./i6:value = '60505'">UN Test 2 (c) (ii): Internal ignition test</xsl:when>
                    <xsl:when test="./i6:value = '108305'">UN Test 3 (a) (i): Bureau of Explosives impact machine</xsl:when>
                    <xsl:when test="./i6:value = '61864'">UN Test 3 (a) (ii): BAM Fallhammer</xsl:when>
                    <xsl:when test="./i6:value = '108306'">UN Test 3 (a) (iii): Rotter test</xsl:when>
                    <xsl:when test="./i6:value = '108307'">UN Test 3 (a) (iv): 30 kg Fallhammer test</xsl:when>
                    <xsl:when test="./i6:value = '108308'">UN Test 3 (a) (v): Modified type 12 impact tool</xsl:when>
                    <xsl:when test="./i6:value = '108309'">UN Test 3 (a) (vi): Impact sensitivity test</xsl:when>
                    <xsl:when test="./i6:value = '108310'">UN Test 3 (a) (vii): Modified Bureau of Mines impact machine test</xsl:when>
                    <xsl:when test="./i6:value = '61865'">UN Test 3 (b) (i): BAM friction apparatus</xsl:when>
                    <xsl:when test="./i6:value = '108311'">UN Test 3 (b) (ii): Rotary friction test</xsl:when>
                    <xsl:when test="./i6:value = '108312'">UN Test 3 (b) (iii): Friction sensitivity test</xsl:when>
                    <xsl:when test="./i6:value = '108313'">UN Test 3 (b) (iv): ABL friction machine test</xsl:when>
                    <xsl:when test="./i6:value = '61866'">UN Test 3 (c) (i): Thermal stability test at 75°C</xsl:when>
                    <xsl:when test="./i6:value = '108314'">UN Test 3 (c) (ii): SBAT thermal stability test at 75 °C</xsl:when>
                    <xsl:when test="./i6:value = '61867'">UN Test 3 (d): Small-scale burning test</xsl:when>
                    <xsl:when test="./i6:value = '60510'">UN Test 4 (a): Thermal stability test for unpackaged articles and packaged articles</xsl:when>
                    <xsl:when test="./i6:value = '60511'">UN Test 4 (b) (i): The steel tube drop test for liquids</xsl:when>
                    <xsl:when test="./i6:value = '60512'">UN Test 4 (b) (ii): Twelve metre drop test for unpackaged articles, packaged articles and packaged substances</xsl:when>
                    <xsl:when test="./i6:value = '60513'">UN Test 5 (a): Cap sensitivity test</xsl:when>
                    <xsl:when test="./i6:value = '60514'">UN Test 5 (b) (i): French DDT test</xsl:when>
                    <xsl:when test="./i6:value = '60515'">UN Test 5 (b) (ii): USA DDT test</xsl:when>
                    <xsl:when test="./i6:value = '60516'">UN Test 5 (b) (iii): Deflagration to detonation transition test</xsl:when>
                    <xsl:when test="./i6:value = '60517'">UN Test 5 (c): External fire test for Division 1.5</xsl:when>
                    <xsl:when test="./i6:value = '108315'">UN Test 6 (a): Single package test</xsl:when>
                    <xsl:when test="./i6:value = '108316'">UN Test 6 (b): Stack test</xsl:when>
                    <xsl:when test="./i6:value = '108317'">UN Test 6 (c): External fire (bonfire) test</xsl:when>
                    <xsl:when test="./i6:value = '108318'">UN Test 6 (d): Unconfined package test</xsl:when>
                    <xsl:when test="./i6:value = '60518'">UN Test 7 (a): EIDS cap test</xsl:when>
                    <xsl:when test="./i6:value = '60519'">UN Test 7 (b): EIDS gap test</xsl:when>
                    <xsl:when test="./i6:value = '60520'">UN Test 7 (c) (i): Susan test</xsl:when>
                    <xsl:when test="./i6:value = '60521'">UN Test 7 (c) (ii): Friability test</xsl:when>
                    <xsl:when test="./i6:value = '60522'">UN Test 7 (d) (i): EIDS bullet impact test</xsl:when>
                    <xsl:when test="./i6:value = '60523'">UN Test 7 (d) (ii): Friability test</xsl:when>
                    <xsl:when test="./i6:value = '60524'">UN Test 7 (e): EIDS external fire test</xsl:when>
                    <xsl:when test="./i6:value = '60525'">UN Test 7 (f): EIDS slow cook-off test</xsl:when>
                    <xsl:when test="./i6:value = '60526'">UN Test 7 (g): 1.6 Article external fire test</xsl:when>
                    <xsl:when test="./i6:value = '60527'">UN Test 7 (h): 1.6 article slow cook-off test</xsl:when>
                    <xsl:when test="./i6:value = '60528'">UN Test 7 (j): 1.6 article bullet impact test</xsl:when>
                    <xsl:when test="./i6:value = '60529'">UN Test 7 (k): 1.6 article stack test</xsl:when>
                    <xsl:when test="./i6:value = '60530'">UN Test 7 (l): 1.6 article fragment impact test</xsl:when>
                    <xsl:when test="./i6:value = '60531'">UN Test 8 (a): Thermal stability test for ammonium nitrate emulsions, suspensions or gels</xsl:when>
                    <xsl:when test="./i6:value = '60532'">UN Test 8 (b): ANE Gap Test</xsl:when>
                    <xsl:when test="./i6:value = '60533'">UN Test 8 (c): Koenen test</xsl:when>
                    <xsl:when test="./i6:value = '60534'">UN Test 8 (d) (i): Vented pipe test</xsl:when>
                    <xsl:when test="./i6:value = '60535'">UN Test 8 (d) (ii): Modified vented pipe test</xsl:when>
                    <xsl:when test="./i6:value = '108319'">UN Test 8 (e): CanmetCERL minimum burning pressure (MBP) test</xsl:when>
                    <xsl:when test="./i6:value = '108320'">UN Test: Burning rate test (external fire)</xsl:when>
                    <xsl:when test="./i6:value = '60537'">limiting impact energy (J)</xsl:when>
                    <xsl:when test="./i6:value = '60538'">limiting load (N)</xsl:when>
                    <xsl:when test="./i6:value = '60539'">fragmented length (cm)</xsl:when>
                    <xsl:when test="./i6:value = '60541'">limiting diameter (mm)</xsl:when>
                    <xsl:when test="./i6:value = '60544'">result is considered "+" (positive)</xsl:when>
                    <xsl:when test="./i6:value = '60545'">result is considered "-" (negative)</xsl:when>
                    <xsl:when test="./i6:value = '60546'">positive, propagation of detonation</xsl:when>
                    <xsl:when test="./i6:value = '60547'">negative, no propagation of detonation</xsl:when>
                    <xsl:when test="./i6:value = '60548'">positive, explosion</xsl:when>
                    <xsl:when test="./i6:value = '60549'">negative, no explosion</xsl:when>
                    <xsl:when test="./i6:value = '60550'">positive, ability to deflagrate</xsl:when>
                    <xsl:when test="./i6:value = '60551'">negative, no ability to deflagrate</xsl:when>
                    <xsl:when test="./i6:value = '60552'">positive, transition from deflagration to detonation</xsl:when>
                    <xsl:when test="./i6:value = '60553'">negative, no transition from deflagration to detonation</xsl:when>
                    <xsl:when test="./i6:value = '60554'">positive, sensitive to detonative shock</xsl:when>
                    <xsl:when test="./i6:value = '60555'">negative, not sensitive to detonative shock</xsl:when>
                    <xsl:when test="./i6:value = '60556'">positive, violent effect on heating under confinement</xsl:when>
                    <xsl:when test="./i6:value = '60557'">negative, no violent effect on heating under confinement</xsl:when>
                    <xsl:when test="./i6:value = '60558'">positive, ability to deflagrate rapidly</xsl:when>
                    <xsl:when test="./i6:value = '60559'">negative, no or slow deflagration</xsl:when>
                    <xsl:when test="./i6:value = '60560'">Division 1.5</xsl:when>
                    <xsl:when test="./i6:value = '60561'">candidate Division 1.1</xsl:when>
                    <xsl:when test="./i6:value = '60562'">not Division 1.1</xsl:when>
                    <xsl:when test="./i6:value = '60563'">Division 1.2</xsl:when>
                    <xsl:when test="./i6:value = '60565'">Division 1.3</xsl:when>
                    <xsl:when test="./i6:value = '60566'">Division 1.4</xsl:when>
                    <xsl:when test="./i6:value = '60567'">Division 1.6</xsl:when>
                    <xsl:when test="./i6:value = '60570'">p = 2070 kPa: yes</xsl:when>
                    <xsl:when test="./i6:value = '60571'">p = 2070 kPa: no</xsl:when>
                    <xsl:when test="./i6:value = '60572'">neither a test for propagation of detonation nor a test for sensitivity to detonative shock is required because the exothermic decomposition energy of the organic substance is less than 800 J/g</xsl:when>
                    <xsl:when test="./i6:value = '60573'">p = 2070 kPa, t &lt; 30 ms</xsl:when>
                    <xsl:when test="./i6:value = '60574'">p = 2070 kPa, t = 30 ms</xsl:when>
                    <xsl:when test="./i6:value = '60575'">p &lt; 2070 kPa</xsl:when>
                    <xsl:when test="./i6:value = '60576'">time for a pressure rise from 690 to 2070 kPa (ms)</xsl:when>
                    <xsl:when test="./i6:value = '60577'">UN Test 3 (b) need not be applied to liquids</xsl:when>
                    <xsl:when test="./i6:value = '60578'">limiting impact energy &gt; 40 J</xsl:when>
                    <xsl:when test="./i6:value = '60579'">limiting load &gt; 360 N</xsl:when>
                    <xsl:when test="./i6:value = '60580'">no ignition, explosion, self-heating or visible decomposition</xsl:when>
                    <xsl:when test="./i6:value = '60581'">mass explosion</xsl:when>
                    <xsl:when test="./i6:value = '60582'">no mass explosion</xsl:when>
                    <xsl:when test="./i6:value = '60583'">potentially hazardous projections</xsl:when>
                    <xsl:when test="./i6:value = '60584'">radiant heat</xsl:when>
                    <xsl:when test="./i6:value = '60585'">violent burning</xsl:when>
                    <xsl:when test="./i6:value = '130898'">full study report</xsl:when>
                    <xsl:when test="./i6:value = '60136'">unstable explosive based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60137'">Division 1.1 (substances, mixtures and articles which have a mass explosion hazard) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60138'">Division 1.2 (substances, mixtures and articles which have a projection hazard but not a mass explosion hazard) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60139'">Division 1.3 (substances, mixtures and articles which have a fire hazard and either a minor blast hazard or a minor projection hazard or both, but not a mass explosion hazard) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60140'">Division 1.4 (substances, mixtures and articles which present no significant hazard) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60141'">Division 1.5 (very insensitive substances or mixtures which have a mass explosion hazard) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60142'">Division 1.6 (extremely insensitive articles which do not have a mass explosion hazard) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60364'">study cannot be used for classification</xsl:when>
                    <xsl:when test="./i6:value = '60366'">GHS criteria not met</xsl:when>
                    <xsl:when test="./i6:value = '2807'">explosive</xsl:when>
                    <xsl:when test="./i6:value = '5655'">non explosive</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AttachedJustification | //xt:CrossReference | //xt:Guideline | //xt:SmallScalePreliminaryTests | //xt:ResultsOfTestSeriesForExplosives | //xt:AttachedBackgroundMaterial">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'ResultsOfTestSeriesForExplosives'">Results of test series for explosives</xsl:when>
                    <xsl:when test="name(.) = 'SmallScalePreliminaryTests'">Small-scale preliminary tests</xsl:when>
                    <xsl:when test="name(.) = 'CrossReference'">Cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Test guideline</xsl:when>
                    <xsl:when test="name(.) = 'AttachedJustification'">Attached justification</xsl:when>
                    <xsl:when test="name(.) = 'AttachedBackgroundMaterial'">Attachments</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:AdministrativeData | //xt:DataSource | //xt:MaterialsAndMethods | //xt:TestMaterials | //xt:AnyOtherInformationOnMaterialsAndMethodsInclTables | //xt:ResultsAndDiscussion | //xt:AnyOtherInformationOnResultsInclTables | //xt:OverallRemarksAttachments | //xt:ApplicantSummaryAndConclusion">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'OverallRemarksAttachments'">Overall remarks, attachments</xsl:when>
                    <xsl:when test="name(.) = 'AdministrativeData'">Administrative data</xsl:when>
                    <xsl:when test="name(.) = 'ApplicantSummaryAndConclusion'">Applicant's summary and conclusion</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterials'">Test material</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnResultsInclTables'">Any other information on results incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'MaterialsAndMethods'">Materials and methods</xsl:when>
                    <xsl:when test="name(.) = 'DataSource'">Data source</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnMaterialsAndMethodsInclTables'">Any other information on materials and methods incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'ResultsAndDiscussion'">Results and discussion</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:StudyPeriod | //xt:JustificationForTypeOfInformation | //xt:Remarks | //xt:VersionRemarks | //xt:MethodNoGuideline | //xt:SpecificDetailsOnTestMaterialUsedForTheStudy | //xt:SpecificDetailsOnTestMaterialUsedForTheStudyConfidential | //xt:OtherInformation | //xt:OtherInformation | //xt:RemarksOnResults | //xt:Remarks | //xt:Conclusions | //xt:ExecutiveSummary">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'MethodNoGuideline'">Principles of method if other than guideline</xsl:when>
                    <xsl:when test="name(.) = 'Remarks'">Remarks</xsl:when>
                    <xsl:when test="name(.) = 'VersionRemarks'">Version / remarks</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Overall remarks</xsl:when>
                    <xsl:when test="name(.) = 'ExecutiveSummary'">Executive summary</xsl:when>
                    <xsl:when test="name(.) = 'Conclusions'">Conclusions</xsl:when>
                    <xsl:when test="name(.) = 'StudyPeriod'">Study period</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForTypeOfInformation'">Justification for type of information</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudy'">Specific details on test material used for the study</xsl:when>
                    <xsl:when test="name(.) = 'OtherInformation'"/>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudyConfidential'">Specific details on test material used for the study (confidential)</xsl:when>
                </xsl:choose>
            </td>
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
