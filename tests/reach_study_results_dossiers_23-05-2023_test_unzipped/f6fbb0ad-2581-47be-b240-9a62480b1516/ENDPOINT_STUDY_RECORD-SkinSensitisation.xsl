<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-SkinSensitisation/7.0" version="1.0">
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
            <td>Skin sensitisation</td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:RobustStudy | //xt:UsedForClassification | //xt:UsedForMSDS | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult">
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
    <xsl:template match="//xt:HoursAfterChallenge | //xt:NoWithReactions | //xt:TotalNoInGroup">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'NoWithReactions'">No. with + reactions</xsl:when>
                    <xsl:when test="name(.) = 'HoursAfterChallenge'">Hours after challenge</xsl:when>
                    <xsl:when test="name(.) = 'TotalNoInGroup'">Total no. in group</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Value | //xt:AtConcentration">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'AtConcentration'">At concentration</xsl:when>
                    <xsl:when test="name(.) = 'Value'">Value</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./value "/>
                <xsl:choose>
                    <xsl:when test="./unitCode = '12'"> %</xsl:when>
                    <xsl:when test="./unitCode = '117909'"> µg/mL</xsl:when>
                    <xsl:when test="./unitCode = '117910'"> µM</xsl:when>
                    <xsl:when test="./unitCode = '117911'"> mg/mL</xsl:when>
                    <xsl:when test="./unitCode = '117912'"> mM</xsl:when>
                    <xsl:when test="./unitCode = '1342'"> other:</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Value">
        <tr>
            <td class="label">Value</td>
            <td class="value">
                <xsl:value-of select="./i6:lowerQualifier "/>
                <xsl:value-of select="./i6:lowerValue "/>
                <xsl:value-of select="./i6:upperQualifier "/>
                <xsl:value-of select="./i6:upperValue "/>
                <xsl:value-of select="./i6:unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataWaivingJustification | //xt:DetailsTestSystem | //xt:PositiveControlSubstances">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'PositiveControlSubstances'">Positive control substance(s)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsTestSystem'">Details of test system</xsl:when>
                    <xsl:when test="name(.) = 'DataWaivingJustification'">Justification for data waiving</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '60869'">the study does not need to be conducted because the substance is spontaneously flammable in air or in contact with water or moisture at room temperature</xsl:when>
                    <xsl:when test="./i6:value = '60939'">the study does not need to be conducted because the substance is a strong acid (pH ≤2.0) or base (pH =&gt;11.5)</xsl:when>
                    <xsl:when test="./i6:value = '62033'">the study does not need to be conducted because the available information indicates that the substance should be classified for respiratory sensitisation or corrosivity</xsl:when>
                    <xsl:when test="./i6:value = '62405'">the study does not need to be conducted because the substance is classified as skin corrosion (Category 1, 1A, 1B or 1C)</xsl:when>
                    <xsl:when test="./i6:value = '62406'">an in vitro skin sensitisation study does not need to be conducted because the available in vitro test methods are not applicable for the substance and therefore an in vivo skin sensitisation study was conducted</xsl:when>
                    <xsl:when test="./i6:value = '62407'">an in vitro skin sensitisation study does not need to be conducted because adequate data from an in vivo skin sensitisation study are available</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                    <xsl:when test="./i6:value = '108181'">cysteine derivative NAC</xsl:when>
                    <xsl:when test="./i6:value = '117882'">cysteine peptide, (Ac-RFAACAA-COOH)</xsl:when>
                    <xsl:when test="./i6:value = '108182'">lysine derivative NAL</xsl:when>
                    <xsl:when test="./i6:value = '117883'">lysine peptide (Ac-RFAAKAACOOH)</xsl:when>
                    <xsl:when test="./i6:value = '1967'">hexyl cinnamic aldehyde (CAS No 101-86-0)</xsl:when>
                    <xsl:when test="./i6:value = '60963'">eugenol (CAS No 97-53-0)</xsl:when>
                    <xsl:when test="./i6:value = '2067'">mercaptobenzothiazole (CAS No 149-30-4)</xsl:when>
                    <xsl:when test="./i6:value = '2207'">not specified</xsl:when>
                    <xsl:when test="./i6:value = '1173'">no data</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Endpoint | //xt:StudyResultType | //xt:PurposeFlag | //xt:Reliability | //xt:RationalReliability | //xt:DataWaiving | //xt:ReasonPurpose | //xt:ReasonPurpose | //xt:DataAccess | //xt:DataProtectionClaimed | //xt:Qualifier | //xt:Guideline | //xt:Deviation | //xt:GLPComplianceStatement | //xt:TypeOfStudy | //xt:DetailsTestSystem | //xt:VehicleSolventControl | //xt:NegativeControl | //xt:PositiveControl | //xt:VehicleSolvent | //xt:PositiveControl | //xt:Species | //xt:Strain | //xt:Sex | //xt:Route | //xt:Vehicle | //xt:AdequacyOfInduction | //xt:No | //xt:Route | //xt:Vehicle | //xt:AdequacyOfChallenge | //xt:PositiveControlSubstances | //xt:Vehicle | //xt:Group | //xt:RunExperiment | //xt:Parameter | //xt:VehicleControlsValid | //xt:NegativeControlsValid | //xt:PositiveControlsValid | //xt:RemarksOnResults | //xt:PredictionModelOutcome | //xt:Reading | //xt:Group | //xt:RemarksOnResults | //xt:Parameter | //xt:RemarksOnResults | //xt:Type | //xt:InterpretationOfResults">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'Group'">Group</xsl:when>
                    <xsl:when test="name(.) = 'DetailsTestSystem'">Details of test system</xsl:when>
                    <xsl:when test="name(.) = 'PositiveControl'">Positive control</xsl:when>
                    <xsl:when test="name(.) = 'PositiveControlsValid'">Positive controls validity</xsl:when>
                    <xsl:when test="name(.) = 'VehicleSolventControl'">Vehicle / solvent control</xsl:when>
                    <xsl:when test="name(.) = 'Sex'">Sex</xsl:when>
                    <xsl:when test="name(.) = 'PredictionModelOutcome'">Outcome of the prediction model</xsl:when>
                    <xsl:when test="name(.) = 'DataWaiving'">Data waiving</xsl:when>
                    <xsl:when test="name(.) = 'AdequacyOfInduction'">Adequacy of induction</xsl:when>
                    <xsl:when test="name(.) = 'PurposeFlag'">Adequacy of study</xsl:when>
                    <xsl:when test="name(.) = 'DataAccess'">Data access</xsl:when>
                    <xsl:when test="name(.) = 'Vehicle'">Vehicle</xsl:when>
                    <xsl:when test="name(.) = 'PositiveControlSubstances'">Positive control substance(s)</xsl:when>
                    <xsl:when test="name(.) = 'TypeOfStudy'">Type of study</xsl:when>
                    <xsl:when test="name(.) = 'Endpoint'">Endpoint</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Remarks on result</xsl:when>
                    <xsl:when test="name(.) = 'RationalReliability'">Rationale for reliability incl. deficiencies</xsl:when>
                    <xsl:when test="name(.) = 'VehicleSolvent'">Vehicle / solvent</xsl:when>
                    <xsl:when test="name(.) = 'DataProtectionClaimed'">Data protection claimed</xsl:when>
                    <xsl:when test="name(.) = 'Qualifier'">Qualifier</xsl:when>
                    <xsl:when test="name(.) = 'Species'">Species</xsl:when>
                    <xsl:when test="name(.) = 'InterpretationOfResults'">Interpretation of results</xsl:when>
                    <xsl:when test="name(.) = 'Route'">Route</xsl:when>
                    <xsl:when test="name(.) = 'No'">No.</xsl:when>
                    <xsl:when test="name(.) = 'RunExperiment'">Run / experiment</xsl:when>
                    <xsl:when test="name(.) = 'AdequacyOfChallenge'">Adequacy of challenge</xsl:when>
                    <xsl:when test="name(.) = 'NegativeControlsValid'">Negative controls validity</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Guideline</xsl:when>
                    <xsl:when test="name(.) = 'ReasonPurpose'">Reason / purpose for cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'GLPComplianceStatement'">GLP compliance</xsl:when>
                    <xsl:when test="name(.) = 'Strain'">Strain</xsl:when>
                    <xsl:when test="name(.) = 'Reading'">Reading</xsl:when>
                    <xsl:when test="name(.) = 'Type'">Type</xsl:when>
                    <xsl:when test="name(.) = 'Parameter'">Parameter</xsl:when>
                    <xsl:when test="name(.) = 'VehicleControlsValid'">Vehicle controls validity</xsl:when>
                    <xsl:when test="name(.) = 'Reliability'">Reliability</xsl:when>
                    <xsl:when test="name(.) = 'Deviation'">Deviations</xsl:when>
                    <xsl:when test="name(.) = 'NegativeControl'">Negative control</xsl:when>
                    <xsl:when test="name(.) = 'StudyResultType'">Type of information</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '60935'">skin sensitisation:  in vitro</xsl:when>
                    <xsl:when test="./i6:value = '60936'">skin sensitisation: in chemico</xsl:when>
                    <xsl:when test="./i6:value = '60933'">skin sensitisation: in vivo (LLNA)</xsl:when>
                    <xsl:when test="./i6:value = '60934'">skin sensitisation: in vivo (non-LLNA)</xsl:when>
                    <xsl:when test="./i6:value = '60937'">skin sensitisation, other</xsl:when>
                    <xsl:when test="./i6:value = '61972'">skin sensitisation</xsl:when>
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
                    <xsl:when test="./i6:value = '410'">EPA OPP 81-6 (Skin Sensitisation)</xsl:when>
                    <xsl:when test="./i6:value = '506'">EPA OPPTS 870.2600 (Skin Sensitisation)</xsl:when>
                    <xsl:when test="./i6:value = '607'">EPA OTS 798.4100 (Skin Sensitisation)</xsl:when>
                    <xsl:when test="./i6:value = '4101'">EU Method B.42 (Skin Sensitisation: Local Lymph Node Assay)</xsl:when>
                    <xsl:when test="./i6:value = '117854'">EU Method B.50 (Skin Sensitisation: Local Lymph Node Assay: DA)</xsl:when>
                    <xsl:when test="./i6:value = '117855'">EU Method B.51 (Skin Sensitisation: Local Lymph Node Assay: BrDU-ELISA)</xsl:when>
                    <xsl:when test="./i6:value = '117856'">EU Method B.59 (In Chemico Skin Sensitisation: Direct Peptide Reactivity Assay (DPRA)</xsl:when>
                    <xsl:when test="./i6:value = '701'">EU Method B.6 (Skin Sensitisation)</xsl:when>
                    <xsl:when test="./i6:value = '117858'">EU Method B.71 (In vitro Skin Sensitisation assays addressing the Key Event on activation of dendritic cells on the Adverse Outcome Pathway (AOP) for Skin Sensitisation</xsl:when>
                    <xsl:when test="./i6:value = '117857'">EU Method: B.60 (In Vitro Skin Sensitisation: ARE-Nrf2 Luciferase Test Method)</xsl:when>
                    <xsl:when test="./i6:value = '1254'">OECD Guideline 406 (Skin Sensitisation)</xsl:when>
                    <xsl:when test="./i6:value = '1277'">OECD Guideline 429 (Skin Sensitisation: Local Lymph Node Assay)</xsl:when>
                    <xsl:when test="./i6:value = '9165'">OECD Guideline 442A (Skin Sensitization: Local Lymph Node Assay: DA)</xsl:when>
                    <xsl:when test="./i6:value = '9166'">OECD Guideline 442B (Skin Sensitization: Local Lymph Node Assay: BrdU-ELISA)</xsl:when>
                    <xsl:when test="./i6:value = '117846'">OECD Guideline 442B (Skin sensitisation: Local Lymph Node Assay: BrdU-ELISA or –FCM)</xsl:when>
                    <xsl:when test="./i6:value = '117848'">OECD Guideline 442C (In Chemico Skin Sensitisation Assays addressing the Adverse Outcome Pathway key event on covalent binding to proteins)</xsl:when>
                    <xsl:when test="./i6:value = '61890'">OECD Guideline 442C (In Chemico Skin Sensitisation: Direct Peptide Reactivity Assay (DPRA))</xsl:when>
                    <xsl:when test="./i6:value = '117852'">OECD Guideline 442D (In Vitro Skin Sensitisation: ARE-Nrf2 luciferase KeratinoSens™ test method)</xsl:when>
                    <xsl:when test="./i6:value = '61889'">OECD Guideline 442D (In Vitro Skin Sensitisation: ARE-Nrf2 Luciferase Test Method)</xsl:when>
                    <xsl:when test="./i6:value = '117853'">OECD Guideline 442E (In Vitro Skin Sensitisation assays addressing the key event on activation of dendritic cells on the Adverse Outcome Pathway for skin sensitisation)</xsl:when>
                    <xsl:when test="./i6:value = '117851'">OECD Guideline 442E (In Vitro Skin Sensitisation: human Cell Line Activation Test (h-CLAT))</xsl:when>
                    <xsl:when test="./i6:value = '2246'">other guideline:</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '4179'">yes (incl. QA statement)</xsl:when>
                    <xsl:when test="./i6:value = '117859'">amino acid derivative reactivity assay (ADRA)</xsl:when>
                    <xsl:when test="./i6:value = '117860'">ARE-Nrf2 luciferase KeratinoSens™ test method</xsl:when>
                    <xsl:when test="./i6:value = '117861'">ARE-Nrf2 luciferase LuSens test method</xsl:when>
                    <xsl:when test="./i6:value = '166'">Buehler test</xsl:when>
                    <xsl:when test="./i6:value = '60948'">direct peptide reactivity assay (DPRA)</xsl:when>
                    <xsl:when test="./i6:value = '347'">Draize test</xsl:when>
                    <xsl:when test="./i6:value = '780'">Freund's complete adjuvant test</xsl:when>
                    <xsl:when test="./i6:value = '813'">guinea pig maximisation test</xsl:when>
                    <xsl:when test="./i6:value = '60946'">activation of dendritic cells</xsl:when>
                    <xsl:when test="./i6:value = '60947'">activation of keratinocytes</xsl:when>
                    <xsl:when test="./i6:value = '117862'">human Cell Line Activation Test (h-CLAT)</xsl:when>
                    <xsl:when test="./i6:value = '117863'">Interleukin-8 Reporter Gene Assay (IL-8 Luc assay)</xsl:when>
                    <xsl:when test="./i6:value = '910'">intracutaneous test</xsl:when>
                    <xsl:when test="./i6:value = '1056'">Maurer optimisation test</xsl:when>
                    <xsl:when test="./i6:value = '1090'">mouse ear swelling test</xsl:when>
                    <xsl:when test="./i6:value = '1091'">mouse local lymph node assay (LLNA)</xsl:when>
                    <xsl:when test="./i6:value = '60942'">mouse local lymph node assay (LLNA): BrdU-ELISA</xsl:when>
                    <xsl:when test="./i6:value = '117864'">mouse local lymph node assay (LLNA): BrdU-FCM</xsl:when>
                    <xsl:when test="./i6:value = '60941'">mouse local lymph node assay (LLNA): DA</xsl:when>
                    <xsl:when test="./i6:value = '1330'">open epicutaneous test</xsl:when>
                    <xsl:when test="./i6:value = '1358'">patch test</xsl:when>
                    <xsl:when test="./i6:value = '60943'">reduced LLNA</xsl:when>
                    <xsl:when test="./i6:value = '60945'">reduced LLNA: BrdU-ELISA</xsl:when>
                    <xsl:when test="./i6:value = '117865'">reduced LLNA: BrdU-FCM</xsl:when>
                    <xsl:when test="./i6:value = '60944'">reduced LLNA: DA</xsl:when>
                    <xsl:when test="./i6:value = '1561'">skin painting test</xsl:when>
                    <xsl:when test="./i6:value = '1574'">split adjuvant test</xsl:when>
                    <xsl:when test="./i6:value = '117866'">U937 cell line activation test (U-SENS™)</xsl:when>
                    <xsl:when test="./i6:value = '117867'">Keratinoses transgenic cell line [442D]</xsl:when>
                    <xsl:when test="./i6:value = '117868'">Lusens transgenic cell line [442D]</xsl:when>
                    <xsl:when test="./i6:value = '117869'">THP-1 cell line [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117870'">THP-G8 cell line [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117871'">U-937 cell line [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117872'">cell culture medium</xsl:when>
                    <xsl:when test="./i6:value = '316'">DMSO</xsl:when>
                    <xsl:when test="./i6:value = '117873'">saline [442E]</xsl:when>
                    <xsl:when test="./i6:value = '1659'">water</xsl:when>
                    <xsl:when test="./i6:value = '117874'">X-VIVO 15 [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117875'">DL-Lactic acid</xsl:when>
                    <xsl:when test="./i6:value = '117876'">4-nitrobenzyl bromide (4-NBB) [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117877'">cinnamic aldehyde [442D]</xsl:when>
                    <xsl:when test="./i6:value = '117878'">dinitrochlorobenzene (DNCB) [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117879'">EGDMA (120 M) [442D]</xsl:when>
                    <xsl:when test="./i6:value = '117880'">nickel sulfate [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117881'">picrylsulfonic acid/2,4,6-trinitro-benzene-sulfonic acid (TNBS) [442E]</xsl:when>
                    <xsl:when test="./i6:value = '108224'">1:1 mix, acetone:acetonitrile</xsl:when>
                    <xsl:when test="./i6:value = '108223'">1:1 mix, water:acetonitrile</xsl:when>
                    <xsl:when test="./i6:value = '1682'">acetone</xsl:when>
                    <xsl:when test="./i6:value = '1684'">acetonitrile</xsl:when>
                    <xsl:when test="./i6:value = '2017'">isopropanol</xsl:when>
                    <xsl:when test="./i6:value = '108225'">mix DMSO:acetonitrile</xsl:when>
                    <xsl:when test="./i6:value = '108229'">cinnamic aldehyde</xsl:when>
                    <xsl:when test="./i6:value = '108230'">phenylacetaldehyde</xsl:when>
                    <xsl:when test="./i6:value = '1952'">guinea pig</xsl:when>
                    <xsl:when test="./i6:value = '2137'">mouse</xsl:when>
                    <xsl:when test="./i6:value = '2301'">rabbit</xsl:when>
                    <xsl:when test="./i6:value = '4828'">human</xsl:when>
                    <xsl:when test="./i6:value = '3487'">Abyssinian</xsl:when>
                    <xsl:when test="./i6:value = '3501'">AKR</xsl:when>
                    <xsl:when test="./i6:value = '3552'">Angora</xsl:when>
                    <xsl:when test="./i6:value = '3502'">B6C3F1</xsl:when>
                    <xsl:when test="./i6:value = '3503'">Balb/c</xsl:when>
                    <xsl:when test="./i6:value = '3553'">Belgian Hare</xsl:when>
                    <xsl:when test="./i6:value = '3504'">C3H</xsl:when>
                    <xsl:when test="./i6:value = '3505'">C57BL</xsl:when>
                    <xsl:when test="./i6:value = '3506'">CAF1</xsl:when>
                    <xsl:when test="./i6:value = '3554'">Californian</xsl:when>
                    <xsl:when test="./i6:value = '3507'">CB6F1</xsl:when>
                    <xsl:when test="./i6:value = '3508'">CBA</xsl:when>
                    <xsl:when test="./i6:value = '60952'">CBA/Ca</xsl:when>
                    <xsl:when test="./i6:value = '60953'">CBA:J</xsl:when>
                    <xsl:when test="./i6:value = '60954'">CBA:JN</xsl:when>
                    <xsl:when test="./i6:value = '3509'">CD-1</xsl:when>
                    <xsl:when test="./i6:value = '3510'">CF-1</xsl:when>
                    <xsl:when test="./i6:value = '3555'">Chinchilla</xsl:when>
                    <xsl:when test="./i6:value = '3511'">DBA</xsl:when>
                    <xsl:when test="./i6:value = '3512'">DBF1</xsl:when>
                    <xsl:when test="./i6:value = '3488'">Dunkin-Hartley</xsl:when>
                    <xsl:when test="./i6:value = '3556'">Dutch</xsl:when>
                    <xsl:when test="./i6:value = '3557'">Flemish Giant</xsl:when>
                    <xsl:when test="./i6:value = '3513'">FVB</xsl:when>
                    <xsl:when test="./i6:value = '3489'">Hartley</xsl:when>
                    <xsl:when test="./i6:value = '3558'">Himalayan</xsl:when>
                    <xsl:when test="./i6:value = '3514'">ICL-ICR</xsl:when>
                    <xsl:when test="./i6:value = '3515'">ICR</xsl:when>
                    <xsl:when test="./i6:value = '3559'">New Zealand Black</xsl:when>
                    <xsl:when test="./i6:value = '3560'">New Zealand Red</xsl:when>
                    <xsl:when test="./i6:value = '3561'">New Zealand White</xsl:when>
                    <xsl:when test="./i6:value = '3516'">NMRI</xsl:when>
                    <xsl:when test="./i6:value = '60957'">Nude</xsl:when>
                    <xsl:when test="./i6:value = '3517'">Nude Balb/cAnN</xsl:when>
                    <xsl:when test="./i6:value = '3518'">Nude CD-1</xsl:when>
                    <xsl:when test="./i6:value = '3490'">Peruvian</xsl:when>
                    <xsl:when test="./i6:value = '3491'">Pirbright-Hartley</xsl:when>
                    <xsl:when test="./i6:value = '3562'">Polish</xsl:when>
                    <xsl:when test="./i6:value = '3563'">San Juan</xsl:when>
                    <xsl:when test="./i6:value = '3519'">Sencar</xsl:when>
                    <xsl:when test="./i6:value = '3492'">Shorthair</xsl:when>
                    <xsl:when test="./i6:value = '3520'">SIV 50</xsl:when>
                    <xsl:when test="./i6:value = '3521'">SKH/HR1</xsl:when>
                    <xsl:when test="./i6:value = '3522'">Strain A</xsl:when>
                    <xsl:when test="./i6:value = '3523'">Swiss</xsl:when>
                    <xsl:when test="./i6:value = '3524'">Swiss Webster</xsl:when>
                    <xsl:when test="./i6:value = '9007'">Tif:MAGf</xsl:when>
                    <xsl:when test="./i6:value = '3564'">Vienna White</xsl:when>
                    <xsl:when test="./i6:value = '1904'">female</xsl:when>
                    <xsl:when test="./i6:value = '2051'">male</xsl:when>
                    <xsl:when test="./i6:value = '2052'">male/female</xsl:when>
                    <xsl:when test="./i6:value = '1877'">epicutaneous, open</xsl:when>
                    <xsl:when test="./i6:value = '1876'">epicutaneous, occlusive</xsl:when>
                    <xsl:when test="./i6:value = '1878'">epicutaneous, semiocclusive</xsl:when>
                    <xsl:when test="./i6:value = '2008'">intradermal</xsl:when>
                    <xsl:when test="./i6:value = '2009'">intradermal and epicutaneous</xsl:when>
                    <xsl:when test="./i6:value = '2437'">unchanged (no vehicle)</xsl:when>
                    <xsl:when test="./i6:value = '60961'">acetone/olive oil (4:l v/v)</xsl:when>
                    <xsl:when test="./i6:value = '1735'">arachis oil</xsl:when>
                    <xsl:when test="./i6:value = '1760'">beeswax</xsl:when>
                    <xsl:when test="./i6:value = '1782'">carbowaxe</xsl:when>
                    <xsl:when test="./i6:value = '1788'">castor oil</xsl:when>
                    <xsl:when test="./i6:value = '194'">CMC (carboxymethyl cellulose)</xsl:when>
                    <xsl:when test="./i6:value = '1804'">coconut oil</xsl:when>
                    <xsl:when test="./i6:value = '1817'">corn oil</xsl:when>
                    <xsl:when test="./i6:value = '1821'">cotton seed oil</xsl:when>
                    <xsl:when test="./i6:value = '60962'">N,N-dimethylformamide</xsl:when>
                    <xsl:when test="./i6:value = '1980'">hydrogenated vegetable oil</xsl:when>
                    <xsl:when test="./i6:value = '2036'">lecithin</xsl:when>
                    <xsl:when test="./i6:value = '2049'">macrogel ester</xsl:when>
                    <xsl:when test="./i6:value = '2050'">maize oil</xsl:when>
                    <xsl:when test="./i6:value = '2071'">methyl ethyl ketone</xsl:when>
                    <xsl:when test="./i6:value = '2221'">olive oil</xsl:when>
                    <xsl:when test="./i6:value = '2253'">paraffin oil</xsl:when>
                    <xsl:when test="./i6:value = '2259'">peanut oil</xsl:when>
                    <xsl:when test="./i6:value = '2261'">petrolatum</xsl:when>
                    <xsl:when test="./i6:value = '2267'">physiological saline</xsl:when>
                    <xsl:when test="./i6:value = '2274'">poloxamer</xsl:when>
                    <xsl:when test="./i6:value = '2275'">polyethylene glycol</xsl:when>
                    <xsl:when test="./i6:value = '2296'">propylene glycol</xsl:when>
                    <xsl:when test="./i6:value = '2360'">silicone oil</xsl:when>
                    <xsl:when test="./i6:value = '2384'">sorbitan derivative</xsl:when>
                    <xsl:when test="./i6:value = '2385'">soya oil</xsl:when>
                    <xsl:when test="./i6:value = '2417'">theobroma oil</xsl:when>
                    <xsl:when test="./i6:value = '2447'">vegetable oil</xsl:when>
                    <xsl:when test="./i6:value = '60964'">highest concentration used causing mild-to-moderate skin irritation and well-tolerated systemically</xsl:when>
                    <xsl:when test="./i6:value = '60965'">highest technically applicable concentration used</xsl:when>
                    <xsl:when test="./i6:value = '60966'">non-irritant substance, but skin pre-treated with 10% SDS</xsl:when>
                    <xsl:when test="./i6:value = '2'">#1</xsl:when>
                    <xsl:when test="./i6:value = '4'">#2</xsl:when>
                    <xsl:when test="./i6:value = '5'">#3</xsl:when>
                    <xsl:when test="./i6:value = '6'">#4</xsl:when>
                    <xsl:when test="./i6:value = '7'">#5</xsl:when>
                    <xsl:when test="./i6:value = '8'">#6</xsl:when>
                    <xsl:when test="./i6:value = '9'">#7</xsl:when>
                    <xsl:when test="./i6:value = '10'">#8</xsl:when>
                    <xsl:when test="./i6:value = '11'">#9</xsl:when>
                    <xsl:when test="./i6:value = '3'">#10</xsl:when>
                    <xsl:when test="./i6:value = '4070'">#11</xsl:when>
                    <xsl:when test="./i6:value = '4071'">#12</xsl:when>
                    <xsl:when test="./i6:value = '4072'">#13</xsl:when>
                    <xsl:when test="./i6:value = '4073'">#14</xsl:when>
                    <xsl:when test="./i6:value = '4074'">#15</xsl:when>
                    <xsl:when test="./i6:value = '4075'">#16</xsl:when>
                    <xsl:when test="./i6:value = '4076'">#17</xsl:when>
                    <xsl:when test="./i6:value = '4077'">#18</xsl:when>
                    <xsl:when test="./i6:value = '4078'">#19</xsl:when>
                    <xsl:when test="./i6:value = '4079'">#20</xsl:when>
                    <xsl:when test="./i6:value = '60967'">highest non-irritant concentration</xsl:when>
                    <xsl:when test="./i6:value = '2203'">not required</xsl:when>
                    <xsl:when test="./i6:value = '1683'">acetone/olive oil (4:1 v/v)</xsl:when>
                    <xsl:when test="./i6:value = '1854'">dimethyl sulphoxide</xsl:when>
                    <xsl:when test="./i6:value = '1855'">dimethylformamide</xsl:when>
                    <xsl:when test="./i6:value = '117887'">test chemical</xsl:when>
                    <xsl:when test="./i6:value = '2490'">mean</xsl:when>
                    <xsl:when test="./i6:value = '117884'">run/experiment 1</xsl:when>
                    <xsl:when test="./i6:value = '117885'">run/experiment 2</xsl:when>
                    <xsl:when test="./i6:value = '117886'">run/experiment 3</xsl:when>
                    <xsl:when test="./i6:value = '117888'">CV70 [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117889'">CV75 [442D and 442E]</xsl:when>
                    <xsl:when test="./i6:value = '117890'">cysteine depletion</xsl:when>
                    <xsl:when test="./i6:value = '117891'">EC 1.5 [442D]</xsl:when>
                    <xsl:when test="./i6:value = '117892'">EC150, CD86 [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117893'">EC200, CD54 [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117894'">IC30 [442D]</xsl:when>
                    <xsl:when test="./i6:value = '117895'">IC50 [442D]</xsl:when>
                    <xsl:when test="./i6:value = '117896'">Imax [442D]</xsl:when>
                    <xsl:when test="./i6:value = '117897'">Ind-IL8LA [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117898'">Inh-GAPLA [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117899'">lysine depletion</xsl:when>
                    <xsl:when test="./i6:value = '117900'">mean cystein depletion</xsl:when>
                    <xsl:when test="./i6:value = '117901'">mean lysine depletion</xsl:when>
                    <xsl:when test="./i6:value = '117902'">mean NAC depletion</xsl:when>
                    <xsl:when test="./i6:value = '117903'">mean NAL depletion</xsl:when>
                    <xsl:when test="./i6:value = '117904'">NAC depletion</xsl:when>
                    <xsl:when test="./i6:value = '117905'">NAL depletion</xsl:when>
                    <xsl:when test="./i6:value = '117906'">nlIL8LA [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117907'">RFI CD54&gt;150 [442E]</xsl:when>
                    <xsl:when test="./i6:value = '117908'">RFI CD86&gt;200 [442E]</xsl:when>
                    <xsl:when test="./i6:value = '64853'">valid</xsl:when>
                    <xsl:when test="./i6:value = '64854'">not valid</xsl:when>
                    <xsl:when test="./i6:value = '2197'">not examined</xsl:when>
                    <xsl:when test="./i6:value = '60969'">no indication of skin sensitisation</xsl:when>
                    <xsl:when test="./i6:value = '117913'">no relevant increase</xsl:when>
                    <xsl:when test="./i6:value = '60970'">positive indication of skin sensitisation</xsl:when>
                    <xsl:when test="./i6:value = '60206'">not determinable</xsl:when>
                    <xsl:when test="./i6:value = '60207'">not determinable because of methodological limitations</xsl:when>
                    <xsl:when test="./i6:value = '60208'">not measured/tested</xsl:when>
                    <xsl:when test="./i6:value = '2864'">data inconclusive</xsl:when>
                    <xsl:when test="./i6:value = '117914'">high reactivity [in chemico]</xsl:when>
                    <xsl:when test="./i6:value = '117915'">low reactivity [in chemico]</xsl:when>
                    <xsl:when test="./i6:value = '117916'">moderate reactivity [in chemico]</xsl:when>
                    <xsl:when test="./i6:value = '117917'">negative [in vitro/in chemico]</xsl:when>
                    <xsl:when test="./i6:value = '117918'">no or minimal reactivity [in chemico]</xsl:when>
                    <xsl:when test="./i6:value = '117919'">positive [in vitro/in chemico]</xsl:when>
                    <xsl:when test="./i6:value = '17'">1st reading</xsl:when>
                    <xsl:when test="./i6:value = '21'">2nd reading</xsl:when>
                    <xsl:when test="./i6:value = '1481'">rechallenge</xsl:when>
                    <xsl:when test="./i6:value = '2149'">negative control</xsl:when>
                    <xsl:when test="./i6:value = '2277'">positive control</xsl:when>
                    <xsl:when test="./i6:value = '60971'">SI</xsl:when>
                    <xsl:when test="./i6:value = '60972'">EC3</xsl:when>
                    <xsl:when test="./i6:value = '60973'">ECt</xsl:when>
                    <xsl:when test="./i6:value = '60974'">no indication of skin sensitisation based on QSAR/QSPR prediction</xsl:when>
                    <xsl:when test="./i6:value = '60975'">positive indication of skin sensitisation based on QSAR/QSPR prediction</xsl:when>
                    <xsl:when test="./i6:value = '130898'">full study report</xsl:when>
                    <xsl:when test="./i6:value = '60976'">Category 1 (skin sensitising) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60977'">Category 1A (indication of significant skin sensitising potential) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60978'">Category 1B (indication of skin sensitising potential) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60364'">study cannot be used for classification</xsl:when>
                    <xsl:when test="./i6:value = '60922'">GHS criteria not met</xsl:when>
                    <xsl:when test="./i6:value = '1720'">ambiguous</xsl:when>
                    <xsl:when test="./i6:value = '2205'">not sensitising</xsl:when>
                    <xsl:when test="./i6:value = '2341'">sensitising</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AttachedJustification | //xt:CrossReference | //xt:Guideline | //xt:Induction | //xt:Challenge | //xt:Results | //xt:ResultsOfTest | //xt:Results | //xt:AttachedBackgroundMaterial">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'Induction'">Induction</xsl:when>
                    <xsl:when test="name(.) = 'Results'">Results</xsl:when>
                    <xsl:when test="name(.) = 'CrossReference'">Cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Test guideline</xsl:when>
                    <xsl:when test="name(.) = 'AttachedJustification'">Attached justification</xsl:when>
                    <xsl:when test="name(.) = 'ResultsOfTest'">Results</xsl:when>
                    <xsl:when test="name(.) = 'AttachedBackgroundMaterial'">Attachments</xsl:when>
                    <xsl:when test="name(.) = 'Challenge'">Challenge</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:AdministrativeData | //xt:DataSource | //xt:MaterialsAndMethods | //xt:TestMaterials | //xt:InVitroTestSystem | //xt:InChemicoTestSystem | //xt:InVivoTestSystem | //xt:TestAnimals | //xt:StudyDesignInVivoNonLLNA | //xt:StudyDesignInVivoLLNA | //xt:AnyOtherInformationOnMaterialsAndMethodsInclTables | //xt:ResultsAndDiscussion | //xt:InVitroInChemico | //xt:TraditionalSensitisationTest | //xt:InVivoLLNA | //xt:AnyOtherInformationOnResultsInclTables | //xt:OverallRemarksAttachments | //xt:ApplicantSummaryAndConclusion">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'OverallRemarksAttachments'">Overall remarks, attachments</xsl:when>
                    <xsl:when test="name(.) = 'AdministrativeData'">Administrative data</xsl:when>
                    <xsl:when test="name(.) = 'InVitroInChemico'">In vitro / in chemico</xsl:when>
                    <xsl:when test="name(.) = 'TestAnimals'">Test animals</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnResultsInclTables'">Any other information on results incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'StudyDesignInVivoLLNA'">Study design: in vivo (LLNA)</xsl:when>
                    <xsl:when test="name(.) = 'InVivoLLNA'">In vivo (LLNA)</xsl:when>
                    <xsl:when test="name(.) = 'InVivoTestSystem'">In vivo test system</xsl:when>
                    <xsl:when test="name(.) = 'InChemicoTestSystem'">In chemico test system</xsl:when>
                    <xsl:when test="name(.) = 'DataSource'">Data source</xsl:when>
                    <xsl:when test="name(.) = 'ApplicantSummaryAndConclusion'">Applicant's summary and conclusion</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterials'">Test material</xsl:when>
                    <xsl:when test="name(.) = 'InVitroTestSystem'">In vitro test system</xsl:when>
                    <xsl:when test="name(.) = 'StudyDesignInVivoNonLLNA'">Study design: in vivo (non-LLNA)</xsl:when>
                    <xsl:when test="name(.) = 'MaterialsAndMethods'">Materials and methods</xsl:when>
                    <xsl:when test="name(.) = 'TraditionalSensitisationTest'">In vivo (non-LLNA)</xsl:when>
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
    <xsl:template match="//xt:NoOfAnimalsPerDose | //xt:NoOfAnimalsPerDose">
        <tr>
            <td class="label">No. of animals per dose</td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:StudyPeriod | //xt:JustificationForTypeOfInformation | //xt:Remarks | //xt:VersionRemarks | //xt:MethodNoGuideline | //xt:JustificationForNonLLNAMethod | //xt:SpecificDetailsOnTestMaterialUsedForTheStudy | //xt:SpecificDetailsOnTestMaterialUsedForTheStudyConfidential | //xt:DetailsOnStudyDesign | //xt:DetailsOnStudyDesign | //xt:DetailsOnTestAnimalsAndEnvironmentalConditions | //xt:ConcentrationAmount | //xt:DaySDuration | //xt:ConcentrationAmount | //xt:DaySDuration | //xt:DetailsOnStudyDesign | //xt:ChallengeControls | //xt:Concentration | //xt:DetailsOnStudyDesign | //xt:Statistics | //xt:OtherInformation | //xt:PositiveControlResults | //xt:CellViability | //xt:OtherEffectsAcceptanceOfResults | //xt:DoseLevel | //xt:ClinicalObservations | //xt:Variability | //xt:TestGroupRemarks | //xt:CellularProliferationDataObservations | //xt:OtherInformation | //xt:RemarksOnResults | //xt:Remarks | //xt:Conclusions | //xt:ExecutiveSummary">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'ConcentrationAmount'">Concentration / amount</xsl:when>
                    <xsl:when test="name(.) = 'VersionRemarks'">Version / remarks</xsl:when>
                    <xsl:when test="name(.) = 'Variability'">Variability</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnStudyDesign'">Details on study design</xsl:when>
                    <xsl:when test="name(.) = 'PositiveControlResults'">Positive control results</xsl:when>
                    <xsl:when test="name(.) = 'StudyPeriod'">Study period</xsl:when>
                    <xsl:when test="name(.) = 'OtherInformation'"/>
                    <xsl:when test="name(.) = 'CellularProliferationDataObservations'">Cellular proliferation data / Observations</xsl:when>
                    <xsl:when test="name(.) = 'Remarks'">Remarks</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Overall remarks</xsl:when>
                    <xsl:when test="name(.) = 'ExecutiveSummary'">Executive summary</xsl:when>
                    <xsl:when test="name(.) = 'DaySDuration'">Day(s)/duration</xsl:when>
                    <xsl:when test="name(.) = 'CellViability'">Cell viability</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudyConfidential'">Specific details on test material used for the study (confidential)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnTestAnimalsAndEnvironmentalConditions'">Details on test animals and environmental conditions</xsl:when>
                    <xsl:when test="name(.) = 'Conclusions'">Conclusions</xsl:when>
                    <xsl:when test="name(.) = 'Concentration'">Concentration</xsl:when>
                    <xsl:when test="name(.) = 'OtherEffectsAcceptanceOfResults'">Other effects / acceptance of results</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForNonLLNAMethod'">Justification for non-LLNA method</xsl:when>
                    <xsl:when test="name(.) = 'Statistics'">Statistics</xsl:when>
                    <xsl:when test="name(.) = 'MethodNoGuideline'">Principles of method if other than guideline</xsl:when>
                    <xsl:when test="name(.) = 'ChallengeControls'">Challenge controls</xsl:when>
                    <xsl:when test="name(.) = 'DoseLevel'">Dose level</xsl:when>
                    <xsl:when test="name(.) = 'ClinicalObservations'">Clinical observations</xsl:when>
                    <xsl:when test="name(.) = 'TestGroupRemarks'">Test group / Remarks</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForTypeOfInformation'">Justification for type of information</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudy'">Specific details on test material used for the study</xsl:when>
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
