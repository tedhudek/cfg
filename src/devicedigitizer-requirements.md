---
title: Device.Digitizer Requirements
description: Device.Digitizer Requirements
ms.assetid: '29a04a8b-537f-41c6-87cd-f64e8f69f12c'
---

# Device.Digitizer Requirements


## Device.Digitizer.Base


Base for Digitizers

|                                 |                                                                                                                   |
|---------------------------------|-------------------------------------------------------------------------------------------------------------------|
| Related Requirements<br/> | Device.Digitizer.Base.DigitizersAppearAsHID<br/> Device.Digitizer.Base.HighQualityDigitizerInput<br/> |

 

### Device.Digitizer.Base.DigitizersAppearAsHID

Digitizers appear to the Windows operating system as human interface device (HID) devices

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Base<br/>                                                                                    |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

Digitizers must not report themselves as a mouse or other proprietary device. In the USB human interface device (HID) usage tables specification, this identification consists of the digitizer page and the usage ID to specify the collection application for pen and touch screens.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Base.HighQualityDigitizerInput

Digitizers must provide a high-quality input experience

|                           |                                      |
|---------------------------|--------------------------------------|
| Target Feature<br/> | Device.Digitizer.Base<br/>     |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> |

 

Description

For devices that support pen or touch input, a pen or touch device must appear to Windows as a human interface device (HID) pen or touch device, respectively. If the device appears a mouse, pen and touch features will not be enabled, and the mouse input requirements will apply. Pen digitizer requirements are as follows:

Pen digitizers must appear to the operating system as HID pen digitizers and not as mouse or other proprietary devices.

Sample rate must be at least 100 Hertz.

Resolution must be at least 600 pixels per inch and at least five times the display resolution.

While hovering within 5 millimeters, the pen's position and the position that the device reports must be within 2 millimeters of each other. This accuracy requirement applies whether the input is stationary or in motion.

The physical contact with the device and the contact position that the device reports must be within 2 millimeters of each other. This accuracy requirement applies whether the input is stationary or in motion.

Touch digitizer requirements are as follows:

Touch digitizers must appear to the operating system as HID touch digitizers and not as mouse or other proprietary devices.

Sample rate must be at least 100 Hertz.

Resolution must be at least 200 pixels per inch and at least matching the display resolution.

In terms of jitter, if a contact is stationary, the reported position data must not change.

In terms of contact accuracy, tracing a line, circle, or other predetermined pattern should produce data that is within 0.5 millimeters of the expected data pattern. The pattern may be offset as a whole in accordance with the following contact-offset requirement.

The physical contact with the device and the contact position that the device reports must be within 2 millimeters of each other. This requirement applies whether the input is stationary or in motion.

Note that we encourage performing linearity calibration before running the pen and touch tests. For more information, see the section about linearity calibration in the OEM Preinstallation Kit (Windows OPK) documentation. For resistive touch digitizers, we recommend optimizing for the touch experience: 80 grams-force spacers provide a good experience.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jun. 26, 2013<br/> |

 

## Device.Digitizer.Pen


Feature for Pen based Digitizers

|                                 |                                                                                                                                                                                                                                      |
|---------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Related Requirements<br/> | Device.Digitizer.Pen.100HzSampleRate<br/> Device.Digitizer.Pen.ContactAccuracy<br/> Device.Digitizer.Pen.HoverAccuracy<br/> Device.Digitizer.Pen.PenRange<br/> Device.Digitizer.Pen.PenResolution<br/> |

 

### Device.Digitizer.Pen.100HzSampleRate

100Hz Sample Rate

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Pen<br/>                                                                                     |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

The pen digitizer will have a sample rate of at least 100Hz.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Pen.ContactAccuracy

Pen contact accuracy

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Pen<br/>                                                                                     |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

The physical contact with the device and the contact position the device reports must be within 2 millimeters of each other. This applies whether the input is stationary or in motion.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Pen.HoverAccuracy

Pen hover accuracy

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Pen<br/>                                                                                     |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

While hovering within 5 millimeters, the pen's position and the position the device reports must be within 2 millimeters of each other. This applies whether the input is stationary or in motion.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Pen.PenRange

The pen digitizer must prevent false recognition of touch gestures from the non-interactive hand

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Pen<br/>                                                                                     |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

The pen digitizer must report that the pen is within range when it is 10 millimeters away from the screen. X and Y coordinates are not required to be reported at 10 millimeters.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Pen.PenResolution

Pen digitizer resolution

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Pen<br/>                                                                                     |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

The pen digitizer resolution must be at least 150 pixels per inch and equal to the native display resolution or greater.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

## Device.Digitizer.Touch


Windows Touch interface for digitizer devices.

|                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|---------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Related Requirements<br/> | Device.Digitizer.Touch.5TouchPointMinimum<br/> Device.Digitizer.Touch.DigitizerConnectsOverUSBOrI2C<br/> Device.Digitizer.Touch.DigitizerJitter<br/> Device.Digitizer.Touch.ExtraInputBehavior<br/> Device.Digitizer.Touch.FieldFirmwareUpdatable<br/> Device.Digitizer.Touch.HIDCompliantFirmware<br/> Device.Digitizer.Touch.HighQualityTouchDigitizerInput<br/> Device.Digitizer.Touch.HighResolutionTimeStamp<br/> Device.Digitizer.Touch.InputSeparation<br/> Device.Digitizer.Touch.NoiseSuppression<br/> Device.Digitizer.Touch.PhysicalDimension<br/> Device.Digitizer.Touch.PhysicalInputPosition<br/> Device.Digitizer.Touch.PowerStates<br/> Device.Digitizer.Touch.ReportingRate<br/> Device.Digitizer.Touch.ResponseLatency<br/> Device.Digitizer.Touch.TouchResolution<br/> Device.Digitizer.Touch.ZAxisAllowance<br/> |

 

### Device.Digitizer.Touch.5TouchPointMinimum

Touch digitizer supports a minimum of five simultaneous touch inputs

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

The touch digitizer must support a minimum of five simultaneous touch inputs. This applies to all touchable areas, including edges and corners.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Touch.DigitizerConnectsOverUSBOrI2C

Digitizer connects over USB or I2C

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

The digitizer must connect to the system over a USB or I2C bus. These buses support the descriptor for the human interface device (HID) or digitizer according to the Human Interface Design Protocol for USB.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Touch.DigitizerJitter

Digitizer's jitter is a maximum of 1 millimeter over 10 millimeters of travel

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

Touch digitizer jitter will not exceed a maximum of 1 millimeter of jitter over 10 millimeters of travel by moving touch inputs. Duplicate packets will not be reported for traveling inputs. While the input is traveling, jitter should not be reported in the direction opposite of the direction of travel. Stationary inputs should produce 0 millimeters of jitter while they are held.

Additional Information

|                                   |                                                                                                                                                                                                                                                               |
|-----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | Windows® can incorrectly recognize the interaction as a drag or other movement. This problem causes users to feel frustrated and to perceive the system as untrustworthy. Correctly reporting the integrity of contact during motion is important.<br/> |
| Enforcement Date<br/>       | Mar. 01, 2012<br/>                                                                                                                                                                                                                                      |

 

### Device.Digitizer.Touch.ExtraInputBehavior

Digitizers do not report inputs greater than maximum

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

If the digitizer supports n simultaneous touch inputs (Where 'n' is the maximum number of supported touch inputs reported through HID), the first n inputs remain valid while additional inputs up to 5 must be ignored. If more than n+5 inputs are placed on the screen and accurate tracking of the original n inputs cannot be guaranteed, then it is strongly recommended to stop tracking all inputs including n+5.

|                             |                                                                                                                                                                                                                                                                                            |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Number of Inputs<br/> | Expected Behavior<br/>                                                                                                                                                                                                                                                               |
| n<br/>                | All n inputs accurately reported <br/>                                                                                                                                                                                                                                               |
| n + 1, …, n+5<br/>    | Initial n inputs accurately reported, while additional inputs greater than n must not be reported. <br/>                                                                                                                                                                             |
| n + 6, … <br/>        | If possible, maintain the same behavior as n+1, …, n+5 above. If this is not possible and the initial n inputs cannot be reported accurately, it is acceptable to report the original inputs as up and to stop reporting all inputs once the 6th additional input is received. <br/> |

 

Below is an illustration of the requirement where n, the maximum number of supported touch inputs reported through HID, is 10.

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left">Number of Inputs<br/></td>
<td align="left">User Scenario <br/></td>
<td align="left"></td>
<td align="left">Expected Behavior<br/></td>
</tr>
<tr class="even">
<td align="left">10<br/></td>
<td align="left">A user places 10 fingers on the screen. <br/></td>
<td align="left"></td>
<td align="left">All 10 touch inputs must be accurately reported. <br/></td>
</tr>
<tr class="odd">
<td align="left">11, ..., 15<br/></td>
<td align="left">A user places 10 fingers on the screen. While the first user is maintaining their 10 fingers on the screen, a second user touches the screen with 5 fingers. <br/></td>
<td align="left"></td>
<td align="left">The initial 10 touch inputs from the first user must be accurately reported throughout the user scenario. The additional 1 to 5 touch inputs from the second user must not be reported.<br/></td>
</tr>
<tr class="even">
<td align="left">16, … <br/></td>
<td align="left">A user places 10 fingers on the screen. While the first user is maintaining their 10 fingers on the screen, a second user touches the screen using more than 5 fingers. <br/></td>
<td align="left"></td>
<td align="left">It is ideal to maintain the same behavior as 11,…, 15 number of inputs above. If it cannot be guaranteed the initial 10 inputs from the first user can be accurately reported, report the first user’s 10 inputs as up and stop reporting all inputs. It is acceptable to immediately begin reporting the initial 10 inputs after the inputs from the second user are removed. Under no circumstance should the reporting of the original users inputs be random and or switch between the users.<br/></td>
</tr>
</tbody>
</table>

 

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Touch.FieldFirmwareUpdatable

Touch Digitizer firmware must be field updatable by customer

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

Touch digitizer firmware binaries must be updateable by the customer in the field.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Touch.HIDCompliantFirmware

Touch digitizer firmware is human interface device (HID) compliant and does not require additional driver installation.

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

Proper human interface device (HID) compliant firmware will not require any additional driver installation.For more information on implementation, see http://go.microsoft.com/fwlink/p/?LinkId=226808

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Touch.HighQualityTouchDigitizerInput

Windows Touch digitizers must provide a high-quality input experience

|                           |                                      |
|---------------------------|--------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>    |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> |

 

Description

Input requirements apply to all touchable areas, including edges and corners, and will be tested over a regular distribution of points and patterns that cover the entire surface. For battery-operated devices, the requirements must be met whether the device is running on AC or battery power. The Windows Touch certification program is available for multi-touch digitizers that have a screen size of 30 inches or smaller. Multi-touch digitizers that are greater than 30 inches can obtain a signed driver through the unclassified category.

Multi-touch digitizers must appear to the operating system as human interface device (HID) digitizers, and not as mouse or other proprietary devices.

Sample rate must be at least 50 Hertz per finger.

Resolution must be at least 25 pixels per inch and at least matching the display resolution.

In terms of jitter, for all fingers, if a contact is stationary, the reported position data must not change.

No data must be reported for locations where contact is not made.

In terms of contact accuracy, the following requirements must be met on all corners of the screen and at least 95 percent of points and patterns tested.

For a single touch on a stationary contact point, the contact position reported must be within 2.5 millimeters of the target point. For a single touch that traces a line, circle, or other predetermined pattern, the contact data reported must be within 2.5 millimeters of the target pattern, with an offset from the pattern that varies no more than 1 millimeter for every 10 millimeters of travel, and without interruption to the pattern. For additional touches on a stationary contact point, the contact position reported must be within 5 millimeters of the target point. For additional touches that trace a line, circle, or other predetermined pattern, the contact data reported must be within 5 millimeters of the target pattern, with an offset from the pattern that varies no more than 2 millimeters for every 10 millimeters of travel, and without interruption to the pattern. Definitions are as follows:

Pixels per inch. Calculation of sqrt(x^2 + y^2)/diagonal screen size in inches, where x is the number of pixels on the horizontal axis and y is the number of pixels on the vertical axis.

Target point. The location targeted on the screen. For a target point that is smaller than the area of contact, the digitizer should determine which part of the contact area should be reported, such as the geometric center of the area or the point of greatest pressure. Microsoft tests will be conducted via the geometric center of the contact area of a typical finger (or rounded stylus) that is at least 12.5 millimeters in diameter. Calibration should occur before logo testing for certification.

Single touch. A touch made when no other contact is present on the screen.

Additional touches. One or more touches made when a contact is already present on the screen, or multiple touches placed simultaneously on the screen.

The Windows Touch certification program is a full test. Independent Hardware Vendors (IHVs) must submit hardware to the Windows Touch Test Lab for manual verification. For more information about the Windows Touch Test Lab, go to http://www.microsoft.com/whdc/device/input/WindowsTouch\_Test-Lab.mspx. Manufacturers should contact their account manager for copies of the OEM Preinstallation Kit (Windows OPK) guidelines. A white paper that provides guidance on HID pen and touch digitizer drivers can be found at http://www.microsoft.com/whdc/device/input/PEN\_touch.mspx.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jun. 26, 2013<br/> |

 

### Device.Digitizer.Touch.HighResolutionTimeStamp

High resolution time stamp

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

One per frame, snapped in association to the frame sample time and not any other time in another stage of the pipeline€”for example, taking the time the scan started rather than when the packet is produced or transmitted. The time stamp can be taken at the beginning or end of the frame, but the setting should remain consistent. There is no need to synchronize it to any definition of absolute time. Use rollover for the time stamp, so there is no need to reset to zero.   Timestamp should be 100 µs units/resolution and be provided to the OS in a 16-bit (2 byte) field in the HID reportAt any instance, allowable clock drift +/- 5% across standard operating temperatures (+25°C to + 85°C)

Additional Information

|                                   |                                                                                                                                                                                                                                                                                                        |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | If a higher-resolution time stamp is available to determine exactly when the data was sampled (which equals the exact time when the finger was touching the reported coordinate of the screen), for example, the gesture recognition can calculate to better determine the intended gesture<br/> |
| Enforcement Date<br/>       | Mar. 01, 2012<br/>                                                                                                                                                                                                                                                                               |

 

### Device.Digitizer.Touch.InputSeparation

Input Separation

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

Distance is measured to center of input and with inputs of 9 millimeters in size. Converging/Diverging zoom interactions must meet at 12 millimeters or less separation for horizontal and vertical, and 15 millimeters or less for diagonal. Interactions:

Zoom diverging and converging 2-finger

Starting contact position is vertical or horizontal: start at 12mm or less

Starting contact position is diagonal: start at 15mm or less

Tap (2-finger, 3-finger, 4-finger):

Contact position is horizontal or vertical: tap with contacts 12mm apart or less

Contact position is diagonal: tap with contacts 15mm apart or less

Swipe - parallel movement (2-finger, 3-finger, 4-finger; up, down, left, right):

Contact position is horizontal or vertical: swipe with contacts 12mm apart or less

Contact position is diagonal: swipe with contacts 15mm apart or less

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Touch.NoiseSuppression

The touch digitizer does not report data for locations where touch input is not made

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

The touch digitizer will not report data ("Phantom/Ghost contacts") for locations where touch input is not made. This applies for both when the system is actively receiving user input and when it is not receiving user input.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Touch.PhysicalDimension

Touch digitizer reports physical dimensions

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

The touch digitizer must report dimensions to the OS which match the visible active size of the display. Reported dimensions can be less than the physical dimensions in cases where the touch digitizer extends beyond the display and bezel into non-visible space. Touch digitizer dimensions will be reported via the Physical Dimensions property.

Additional Information

|                                   |                                                                                                                                           |
|-----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | Inaccurate information about the physical dimensions can affect the ability of Windows Touch to accurately recognize gestures.<br/> |
| Enforcement Date<br/>       | Mar. 01, 2012<br/>                                                                                                                  |

 

### Device.Digitizer.Touch.PhysicalInputPosition

Digitizer reports physical contact with the device and the contact position

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

The touch digitizer reports all inputs within plus or minus 1 millimeter of the center of the physical input for all touchable areas. All pixels on the screen must be touchable, including edges and corners.For additional details on verification and testing of this requirement please see http://go.microsoft.com/fwlink/?LinkID=234575

Additional Information

|                                   |                                                                                                                                                   |
|-----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | Minimal offset between the actual and reported points of contact is a primary factor in the real and perceived accuracy of the system.<br/> |
| Enforcement Date<br/>       | Mar. 01, 2012<br/>                                                                                                                          |

 

### Device.Digitizer.Touch.PowerStates

The touch controller is required to implement three different power states: Active, Idle, and Off

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

The touch controller is required to implement three different power states:Active - The state where the touch controller is fully powered and functioning per device requirements. Idle - The state transitioned to from 'Active' when the touch controller has not received input for a specified period of time. Idle timeout is fixed at 5 seconds (by the OS) when connected via USB due to selective suspend requirements/implementation, and shall be fixed at 300 seconds by the touch controller when connected via I2C.Off - The state where the touch controller is powered down

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Touch.ReportingRate

100 Hertz minimum reporting rate for all touch inputs

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

When in an active power state, the touch digitizer reporting rate must be maintained at a minimum of 100 Hertz for all touch inputs reported through HID, for both stationary and non-stationary inputs. All reports must be uniquely sampled.

Additional Information

|                                   |                                                                                                                                                  |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | A high packet rate promotes high performance, perceived responsiveness of the system, and data integrity for contacts in fast motion.<br/> |
| Enforcement Date<br/>       | Mar. 01, 2012<br/>                                                                                                                         |

 

### Device.Digitizer.Touch.ResponseLatency

Digitizer response latency for idle and active states

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

The touch digitizer must have response latency from an active state that is not greater than 25 milliseconds for the initial input. The touch digitizer must have response latency from an idle state that is not greater than 50 milliseconds for the initial input. Both Active and Idle are internal power state of the touch controller. The response latency for subsequent contacts in an active state should not be greater than 15 milliseconds. Response latency will be measured as the time when the input touches the screen to the time when the Windows operating system receives the data from the hardware.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Touch.TouchResolution

Touch digitizer resolution equals native display resolution or greater

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

At a minimum, the touch digitizer resolution will be equal the native display resolution or greater. Every pixel of the display in an integrated touch digitizer is required to be accessible to touch input. Every pixel includes pixels on the edges and in the corners of the display.For additional details on verification and testing of this requirement please see http://go.microsoft.com/fwlink/?LinkID=234575

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

### Device.Digitizer.Touch.ZAxisAllowance

Maximum z-axis allowance for touch detection

|                           |                                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Digitizer.Touch<br/>                                                                                   |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

The maximum allowed z-axis for touch detection is 0.5 millimeters. Where possible, a user's input should make physical contact with the screen before a touch input is registered.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Mar. 01, 2012<br/> |

 

 

 





