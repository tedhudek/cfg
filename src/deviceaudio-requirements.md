---
title: Device.Audio Requirements
description: Device.Audio Requirements
ms.assetid: '57266ee9-5179-432b-bf06-44bcbbaee79a'
---

# Device.Audio Requirements


## Device.Audio.APO.WinPEConformance


System effect APOs comply with Windows Protected Environment conformance and compliance criteria

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.APO<br/>                                                                                                                                                                                                                                                    |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Audio Processing Objects (APOs) that are loaded into the system effect infrastructure by the audio device driver INF must be signed with a certificate indicating conformance and compliance with the robustness rules of the Windows Protected Environment. This signature attribute is granted automatically as part of the submission process dependent on signing of the Test Agreements.See Code Signing for Protected Media Components in Windows at http://go.microsoft.com/fwlink/?LinkId=70751.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jul. 17, 2008<br/> |

 

## Device.Audio.AudioController


This Audio Controller must match all Audio Controller tests

|                                 |                                                                |
|---------------------------------|----------------------------------------------------------------|
| Related Requirements<br/> | Device.Audio.AudioController.HDControllerCompliance<br/> |

 

### Device.Audio.AudioController.HDControllerCompliance

HD Audio controllers comply with the Intel HD Audio specification

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.AudioController<br/>                                                                                                                                                                                                                                        |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Requirement Device.Audio.AudioController.HDAudioVersionNumber has been merged with this one.

An audio or modem controller must be implemented as an HD Audio controller (except where noted otherwise within this document). The controller must:

Be implemented according to Intel High Definition Audio Controller specification, Revision 1.0.

Be updated to comply with future specification revisions.

Comply with the latest HD Audio specification ECRs in accordance with policies around new hardware requirements.

HD Audio hardware that complies with HD Audio specification version 1.0 must set the correct version number in the appropriate registers. The VMAJ and VMIN registers must specify a major version number of 01h and a minor version number of 00h.

Additional Information

|                             |                                                                                                                                                                                              |
|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Exceptions<br/>       | Devices that support Always On Always Connected (AOAC) and hardware offloading are exempt from the UAA requirements and therefore are not required to use an HD Audio controller.<br/> |
| Enforcement Date<br/> | Jul. 12, 2008<br/>                                                                                                                                                                     |

 

## Device.Audio.Base


This Device must match all base tests.

|                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Related Requirements<br/> | Device.Audio.Base.AudioProcessing<br/> Device.Audio.Base.BasicDataFormats<br/> Device.Audio.Base.ChannelMasks<br/> Device.Audio.Base.DCOffset<br/> Device.Audio.Base.DRM<br/> Device.Audio.Base.ExposedAudioEndpointsAreFunctional<br/> Device.Audio.Base.JackConnectorStateDescription<br/> Device.Audio.Base.JackDetection<br/> Device.Audio.Base.KSPROPERTYAUDIOVOLUMELEVEL<br/> Device.Audio.Base.KSTopologyCompliance<br/> Device.Audio.Base.NoUncontrollableStreamRouting<br/> Device.Audio.Base.NoUndiscoverableDevice<br/> Device.Audio.Base.PowerManagement<br/> Device.Audio.Base.RealtimeDriversSupportStandardLoopedStreaming<br/> Device.Audio.Base.ReportSupportedProperties<br/> Device.Audio.Base.SamplePositionAccuracy<br/> Device.Audio.Base.TimeSynchronizedSampleRates<br/> Device.Audio.Base.TipRing<br/> Device.Audio.Base.TwoDMAEnginesAndConnections<br/> Device.Audio.Base.VolumeControl<br/> Device.Audio.Base.WAVEFORMATEXTENSIBLESupport<br/> Device.Audio.Base.WaveRTConformance<br/> Device.Audio.Base.ZeroGlitch<br/> |

 

### Device.Audio.Base.AudioProcessing

Audio devices support proper audio processing discovery and control.

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

This requirement was formally known as Device.Audio.Base.NoUndiscoverableDevice.

Drivers

A Driver must support a raw pin at minimum but may support a raw and default pin as long as both are available simultaneously. On the pins provided to the system the hardware must supply a post-mix volume and mute on the render side and peak metering for both render and capture. Bluetooth and USB drivers which are powering devices that have processing which cannot be turned off are allowed to support default mode without raw mode.

Endpoint effects must be scenario neutral. The endpoint effects should work in all scenarios. For effects that may harm a scenario such as real time communications or only be beneficial to one scenario, the effect should be placed into the mode effects that are specific to that scenario.

In addition drivers that support the RAW mode must support the following depending on your driver structure:

A driver that supports mixing without offload support (supports multiple concurrent modes but does not support offload) shall include a KSNODETYPE\_SUM node and no KSNODETYPE\_AUDIO\_ENGINE node. The node shall have a single input connection coming from the software pin factory, and represents the point where multiple instances of the pin are mixed.

The KSNODETYPE\_AUDIO\_ENGINE or KSNODETYPE\_SUM node shall be in the path between the software pin factories and the endpoint bridge pin. The node shall be in the same filter as the software pin factories.

The node shall support KSPROPERTY\_AUDIOSIGNALPROCESSING\_MODES.

For Port Class drivers, the miniport shall support IMiniportAudioSignalProcessing. The port shall add KSPROPERTY\_AUDIOSIGNALPROCESSING\_MODES to the appropriate pin.

A driver that supports mixing (with offload and/or multiple modes) shall support a loopback pin.

Loopback pins shall be in new pin category KSPINCATEGORY\_AUDIOLOOPBACK. The topology shall have a path from the software pin factory to the loopback pin factory. Audio endpoint builder shall not consider these pins when determining unique endpoints.

A driver that does not support mixing shall support KSPROPERTY\_AUDIOSIGNALPROCESSING\_MODES on the endpoint's software pin factory.

For Port Class drivers, the miniport shall support IMiniportAudioSignalProcessing. The port shall add KSPROPERTY\_AUDIOSIGNALPROCESSING\_MODES to the appropriate pin.

The software pin factory data ranges shall include KSATTRIBUTE\_AUDIO\_SIGNALPROCESSINGMODE. The attribute shall not be marked KSATTRIBUTE\_REQUIRED.

The pin creation code shall check for KSDATAFORMAT\_ATTRIBUTES in the data format and process the KSATTRIBUTE\_AUDIOSIGNALPROCESSINGMODE if present.

For Port Class drivers, the driver's implementation of NewStream on IMiniportWaveRT, IMiniportWavePci, or IMiniportWaveCyclic shall support KSDATAFORMAT\_ATTRIBUTES.APOs

If the driver's APOs support DEFAULT then the offload pin shall support DEFAULT.

The APOs shall support all modes that are supported by the offload pin.

APOs shall support all the modes supported by the host pin.

Offload may support RAW.

Discovery

Driver must expose all audio effect via the FXStreamCLSID, FXModeCLSID, and FXEndpointCLSID APOs (or proxy APOs). The APOs must send an accurate list of effects that are enabled to the system when queried. Drivers must support APO change notifications and only notify the system when an APO change has occurred.

There shall be no undiscoverable or uncontrollable hardware, firmware or 3rd party software-based AGC, AEC, Beam Forming, Noise suppression or anything else that significantly alters the audio samples (e.g. non-linear processing) from/to the device.

Loopback

The loopback stream should represent the stream coming out of the speaker. Drivers with hardware processing must provide the system an accurate loopback stream.

Non-offload drivers that support mixing must support DRMRIGHTS on all pin instances. If any stream in the graph on a given pin instance requires loopback constriction, then the audio system asserts DRMRIGHTS.CopyProtect on that pin.

Additional Information

|                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
|-----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Exceptions<br/>       | Windows 8 and Windows 7 drivers do not have to implement the new method of processing discovery, however they cannot have uncontrollable processing as described above. This processing is allowable on audio recording or playback streams if a means is provided for users to disable the processing on their systems, either by exposing the effects as APOs or through another solution. Once disabled by a user, processing must remain off on that product until a user turns it back on. Digital effects may default to enabled or disabled on first use.<br/> |
| Enforcement Date<br/> | Jun. 26, 2013<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

 

### Device.Audio.Base.BasicDataFormats

Audio subsystem supports basic data formats

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

The requirement Device.Audio.Base.IndependentInputOutputFormatSelection has been merged with this one.

When the Microsoft software sample rate conversion (SRC) is used, hardware SRC is not required. Windows provides software mixing and SRC, which eliminates the requirement for hardware to support multiple sample rates.

|                                                          |                                                          |
|----------------------------------------------------------|----------------------------------------------------------|
| Device Type<br/>                                   | Required Sample Rate<br/>                          |
| Communications-only audio device<br/>              | At least one of 16 kHz, 44.1 kHz, or 48 kHz\*<br/> |
| General-purpose or media-capable audio device<br/> | At least one of 44.1 kHz or 48 kHz\*\*<br/>        |

 

\* Bluetooth HFP drivers that do not implement wideband speech are bound by the standard to support only 8 kHz. This is an accepted exception.

\*\* Unless further specified by external specifications or other WHCK requirements. For example, HDMI audio requires both 44.1 kHz and 48 kHz, and Bluetooth A2DP requires both 44.1 kHz and 48 kHz for a Bluetooth sink. Windows HCK tests may enforce these stricter specifications. Hardware offload pins must support additional formats as specified in Device.Audio.HardwareAudioProcessing.AudioHardwareOffloading.

Support for other rates (such as 8, 11.025, 16, 22.05, 32, 96, 192, and 384 kHz) in hardware is optional.

This requirement is valid for both input and output devices.

If the built-in or external audio device includes both input and output capabilities, the audio device must support independent selection of input and output sample rates and support concurrent streaming at arbitrarily selected sample rates.

Additional Information

|                                   |                                                                                                                                                                                                                                                                                                                                                                                                         |
|-----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | Justification Full duplex audio is essential to support emerging communications applications such as Internet Protocol (IP) telephony, conferencing, and network gaming. These applications require the audio system to play back and record simultaneously. The following requirements ensure that full duplex operation is available and performance is consistent across implementations.<br/> |
| Enforcement Date<br/>       | Jul. 17, 2008<br/>                                                                                                                                                                                                                                                                                                                                                                                |

 

### Device.Audio.Base.ChannelMasks

Audio device that supports multichannel audio formats properly handles channel masks

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

If the audio device supports multichannel audio formats, the audio device driver must deal with channel masks consistent with the content and the current selected speaker configuration. If supported, the device properly handles 5.1 and 7.1 PCM formats. The channels are routed to the proper analog lines, and these requirements apply for all the channels except LFE.See the Audio Driver Support for Home Theater Speaker Configurations whitepaper at http://go.microsoft.com/fwlink/?LinkId=65430.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jul. 17, 2008<br/> |

 

### Device.Audio.Base.DCOffset

Audio capture device DC offset is limited within range of + or - 0.15 on a scale from -1.0 to +1.0

|                           |                                                                                                                                                          |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                             |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> |

 

Description

Audio capture device DC offset is limited within range of + or - 0.15 on a scale from -1.0 to +1.0

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Sep. 17, 2008<br/> |

 

### Device.Audio.Base.DRM

Audio device implements DRM support as defined in the Windows Driver Kit

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Audio devices must comply with Windows trusted audio paths for digital rights management (DRM). Hardware that complies with Windows DRM supports DRM level 1300. The audio drivers must not call the DrmForwardContentToFileObject function.The DRM requirement does not apply if the underlying device is a Bluetooth audio device. Design Notes: See the"Digital Rights Management" topic in the Windows Driver Kit.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jul. 17, 2008<br/> |

 

### Device.Audio.Base.ExposedAudioEndpointsAreFunctional

Audio device must be functional (capable of capture/render) all the time while the system is powered on.

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Exposed Audio Endpoints in a system must be functional (capable of capture/render) all the time while the system is powered on. Built-in speakers and microphones must work while the system is operational.Exposed audio end points continue to function even during system state changes such as:\* while the power source changes from external to battery or vice versa\* while the GPU switches from a to b

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Sep. 17, 2008<br/> |

 

### Device.Audio.Base.JackConnectorStateDescription

Audio drivers support specific properties to describe state of jack/connector

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Audio drivers must support the following properties: KSPROPERTY\_JACK\_DESCRIPTION and KSPROPERTY\_JACK\_DESCRIPTION2. \* For every endpoint exposed by an HD Audio driver, the driver must respond to a KSPROPERTY\_JACK\_DESCRIPTION request with a KSJACK\_DESCRIPTION structure.\* For every endpoint exposed by an HD Audio driver, the driver must respond to a KSPROPERTY\_JACK\_DESCRIPTION2 request with a KSJACK\_DESCRIPTION2 structure.\* The structures must be populated to accurately reflect the hardware state.\* Third-party jack-presence-detecting drivers use KSJACK\_DESCRIPTION.IsConnected for KSPROPERTY\_JACK\_DESCRIPTION and jackdesc2\_presence\_detect\_capability for KSPROPERTY\_JACK\_DESCRIPTION2.Refer to http://msdn.microsoft.com/library/ff537484(v=VS.85).aspx 

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Exceptions<br/>       | USB audio 1.0<br/> |
| Enforcement Date<br/> | Jun. 01, 2009<br/> |

 

### Device.Audio.Base.JackDetection

Audio devices need to support jack detection

|                           |                                                                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                 |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Requirements Device.Audio.Base.DockingStation, Device.Audio.HDAudio.AnalogJackDetection, and Device.Audio.HDAudio.DigitalJackDetection have been merged with this one

General Jack Detection:

Analog and digital jacks need to support jack presence detection, except for USB Audio 1.0 devices and S/PDIF. Third party drivers must advertise this to the OS via KSJACK\_DESCRIPTION2.JackCapabilities and relay jack connection state to the OS via KSJACK\_DESCRIPTION.IsConnected

Jacks on the device should show up as disconnected in control panel if they are not connected but are accessible for use.

Dock Jack Detection:

Audio jacks on docking stations need to support the below three states:

The system is not plugged in to the dock: The dock audio device should not appear in the Sound control panel at all.

The system is plugged in to the dock, but nothing is plugged into the jack: The dock audio device should appear in the Sound control panel as "unplugged" (DEVICE\_STATE\_DISCONNECTED.)

The system is plugged in to the dock, and something is plugged into the jack: The dock audio device should appear in the Sound control panel as "working" (DEVICE\_STATE\_ACTIVE.)

When the system is undocked and is using the HD Audio class driver, it is acceptable for devices on dock to show as unplugged. USB Audio 1.0 cannot be used in docks if they only expose audio jacks. If audio jacks are provided on a dock, they must support jack detection. USB Audio 1.0 can be used for speakers integrated into a dock.

Additional Notes for Analog HDAudio Jacks:

The HD Audio codec and the system board must implement HD Audio-compliant jack-presence detection for analog jacks. Presence detection implies that the codec with required system components (jack connector and jack detection circuit) must be able to detect the presence of jack insertion into and jack removal from the input/output connectors that the codec is using. When this occurs an unsolicited response is sent so that software can be notified without constantly polling the device. Implementation of unsolicited response support for jack detection events is required for Windows although it may be worded as optional in the HD Audio specification.

This requirement is unrelated to the feature of automatic sensing of what the peripheral might be. Sensing by using impedance matching is not required.

This requirement specifically means that the codec implements presence detection on each exposed pin that is connected to a system connecter (jack) and that the system board implements an audio jack detection circuit (HD Audio Specification section 7.4.2) external to the codec for each jack on the system. This requirement does not apply to device types defined in the HD Audio codec's pin configuration register defaults as a Line Connector device using an RCA type physical connector.

See the Microsoft UAA HD Audio Pin Configuration Programming Guidelines white paper for additional clarifications on the specified jack connectors that require jack detection.

http://www.microsoft.com/whdc/device/audio/PinConfig.mspx

Additional Notes for Digital HDAudio Jacks:

The HD Audio codec and the system board must implement HD Audio-compliant jack-presence detection for digital jacks. Presence detection implies that the codec with required system components (jack connector and jack detection circuit) must be able to detect the presence of jack insertion into and jack removal from the input/output connectors that the codec is using except for S/PDIF jacks. When this occurs an unsolicited response is sent so that software can be notified without constantly polling the device. Implementation of unsolicited response support for jack detection events is required for Windows although it may be worded as optional in the HD Audio specification.

This requirement is unrelated to the feature of automatic sensing of what the peripheral might be.

Additional Notes about USB Devices:

All USB version references in this requirement are in terms of the release versions of the USB Device Class Definition for Audio Devices document not the USB Bus Specification versions.

Additional Information

|                                   |                                                                                                                                    |
|-----------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | This requirement helps Windows conform to default device heuristics in routing audio streams to appropriate end points.<br/> |
| Enforcement Date<br/>       | Jun. 26, 2013<br/>                                                                                                           |

 

### Device.Audio.Base.KSPROPERTYAUDIOVOLUMELEVEL

Audio driver that implements KSNODETYPE\_VOLUME correctly supports the KSPROPERTY\_AUDIO\_VOLUMELEVEL property

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

If a driver implements support for KSNODETYPE\_VOLUME, that node must correctly support the KSPROPERTY\_AUDIO\_VOLUMELEVEL property whose value is a multiple of decibels. Design Notes: See the Windows Driver kit, "KSNODETYPE\_VOLUME." The decibel values are documented on MSDN.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Sep. 17, 2008<br/> |

 

### Device.Audio.Base.KSTopologyCompliance

Audio Device Driver provides kernel streaming topology according to the documentation in the Microsoft Windows Driver Kit

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Some important examples (not inclusive of all the driver has to adhere to, see the WDK for full disclosure): Check Pin KsDataRangeIf a datarange structure (KSDATARANGE structure) has a "Specifier" value KSDATAFORMAT\_SPECIFIER\_WAVEFORMATEX, then: FormatSize must be sizeof(KSDATARANGE\_AUDIO).KSDATARANGE\_AUDIO values must have: - SampleFrequency is between 1 Hz and 2,000,000 Hz - BitsPerSample are between 8 and 32 bits.Check Orphaned PinsAll pins must have at least one internal connection and none can be orphaned.Node Verifications:All Nodes Pin I/O CountFor all node types specified in the MSDN, the following is a list of the required number of input and output connections.

|                                               |                             |                              |
|-----------------------------------------------|-----------------------------|------------------------------|
| KS Node<br/>                            | Number of Inputs<br/> | Number of Outputs<br/> |
| KSNODETYPE\_MUX<br/>                    | &gt;= 1<br/>          | 1<br/>                 |
| KSNODETYPE\_SUM<br/>                    | &gt; =1<br/>          | 1<br/>                 |
| KSNODETYPE\_DEMUX<br/>                  | 1<br/>                | &gt; 1<br/>            |
| KSNODETYPE\_ACOUSTIC\_ECHO\_CANCEL<br/> | 2<br/>                | 2<br/>                 |
| KSNODETYPE\_DEV\_SPECIFIC<br/>          | Not Specified<br/>    | Not Specified<br/>     |
| All other nodes<br/>                    | 1<br/>                | 1<br/>                 |

 

Check Orphaned Nodes Checks to make sure that all nodes have connections to other nodes and no orphaned nodes are left.All channel properties, including channels returning Boolean values, such as mute, must include one MembersHeader, and the MembersCount field must accurately describe the number of channels. This requirement also applies to mono controls.Test your device driver with the KS Topology test to ensure compliance with this requirement.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Sep. 17, 2008<br/> |

 

### Device.Audio.Base.NoUncontrollableStreamRouting

Audio driver does not perform undiscoverable stream redirection or perform other hidden stream handling that is unknown and/or uncontrollable by user or the Windows Audio System.

|                           |                                                                                                                                                                                                                                   |
|---------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                      |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x64 ARM (Windows RT)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> |

 

Description

Requirement Device.Audio.Base.NoHiddenStreamRouting has been merged with this one.

Audio driver does not perform undiscoverable stream redirection or perform other hidden stream handling that is unknown and/or uncontrollable by user or the Windows Audio System.

Audio driver does not perform hidden stream redirection, routing, switching, splitting, mixing, muxing to other exposed or hidden logical audio devices, applications or other entities but ensures the audio stream from the audio system endpoint for a particular logical device is only directed to that particular logical device that the application is streaming to, as set by the Windows user in the Windows Sound control panel.

The handling of streams is an application layer feature and must not be performed by audio drivers in fashions not discoverable to Windows.

Audio device must not require analog circuitry designed to mix audio signals between the various device inputs and outputs or signals routing from one DAC to multiple output connectors or from multiple input connectors to one ADC for playback and capture operations in other ways than defined in the UAA HD Audio Pin Config Guidelines.

The device must be able to rely on the operating system to support various throughput and monitoring scenarios and provide independent or otherwise pre-defined by Microsoft audio device implementation guidelines audio connectivity on the PC.

This requirement does not prohibit a codec from having a mixer, it implies that the codec must not require the mixer for I/O.

This requirement does not prohibit hardware from supporting audio hardware offloading, provided the HW audio capabilities are exposed in a manner consistent with Windows and meet the Device.Audio.HardwareAudioProcessing requirements.

DAC's and ADC's must have direct I/O from jacks to the operating system.

A Windows friendly audio driver exposes the capabilities and peculiarities of the independent logical audio endpoints that the audio device or system audio implementation supports. The audio driver provides other hardware specific support enabling use of the device on Windows but the audio driver does not enact policies on the streams coming from the Windows application layer destined for a selected logical audio endpoint on the device or other devices.

The PC streaming audio device should behave like a transparent entity without any processing, including mixing paths in the analog domain that the operating system is unaware of. This enables predictability and a uniform audio experience for all Windows users.

Additional Information

|                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | The move towards a discoverable audio subsystem empowers WIndows applications and Windows itself to provide flexible and powerful media streaming policies for user/OEm control. This initiative abstracts the choices of where streams go from the hardware and kernel mode driver code where it is hidden and uncontrollable by the Windows user in most cases. This requirement will enable a more powerful, feature rich Windows audio system in the future and also allow more control to the applications run<br/> |
| Enforcement Date<br/>       | Jun. 01, 2009<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

 

### Device.Audio.Base.NoUndiscoverableDevice

Audio device does not use undiscoverable and/or uncontrollable non-linear audio processing that is on by default.

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Some applications depend on accessing unaltered audio data to provide the intended user experience.  Products must be capable of providing audio data from Windows applications to listener's ear, or from user's mouth to Windows application that is not modified in any way by the Audio Device in hardware, firmware or 3rd party software.  This means that there shall be no undiscoverable or uncontrollable hardware, firmware or 3rd party software-based AGC, AEC, Beam Forming, Noise suppression or anything else that significantly alters the audio samples (e.g. non-linear processing) from/to the device. Processing of this type is allowable on audio recording or playback streams if a means is provided for users to disable the processing on their systems, either by exposing the effects as APOs or through another solution.  Once disabled by a user, processing must remain off on that product until a user turns it back on.There is an exception for processing that protects system reliability.  This may be on by default and not provide a disable mechanism.   Companies that implement reliability effects must ensure the processing elements are reliable and do not pose compatibility issues with the wide range of Windows application needs.  Digital effects may default to enabled or disabled on first use.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jun. 01, 2009<br/> |

 

### Device.Audio.Base.PowerManagement

Audio device complies with related power management specifications

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Requirements Device.Audio.Base.RestartWithinASpecifiedDuration and Device.Audio.Base.ResumeLatency have been merged into this one.

Audio devices must comply with Audio Device Class Power Management Reference Specification, Version 1.0, which provides definitions of the OnNow device power states (D0–D3) for these devices. The specification also covers the device functionality expected in each power state and the possible wake-up event definitions for the class. The device and driver must implement support for power state D3. Support for other device power management states is optional.

For implementation details, refer to Audio Device Power Management Reference Specification, Version 1.0, at http://go.microsoft.com/fwlink/?LinkId=58377.

Audio device restarts working within a delay of 10 seconds for S1-S3 and 15 seconds for S4.

Refer to: http://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/AudPMSpc.rtf

For Windows 8 and beyond, Audio adapter should have resume latency to running state (D0) less than the specified values

Using the new IAdapterPowerManagement3 interface, PortCls generates a new D3 exit latency tolerance and communicates it dynamically to the audio miniport. These tolerances are represented as PC\_EXIT\_LATENCY enumeration values as defined below.

|                                    |                                                                                  |
|------------------------------------|----------------------------------------------------------------------------------|
| PC\_EXIT\_LATENCY<br/>       | Maximum Time to Resume to D0<br/>                                          |
| PcExitLatencyInstant<br/>    | &lt;1 ms (Do not power down – will only be sent when device is in D0)<br/> |
| PcExitLatencyFast<br/>       | 35 ms<br/>                                                                 |
| PcExitLatencyResponsive<br/> | 300 ms<br/>                                                                |

 

On systems that support AOAC (always on always connected), each audio device (this includes integrated devices as well as Bluetooth, USB, etc.) should be able to render and capture even when the screen is off with no glitches or gaps. This includes the period of transition from screen on to screen off. Furthermore, the system should enter its low power audio platform state if the only devices being used support hardware offloading.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jun. 26, 2013<br/> |

 

### Device.Audio.Base.RealtimeDriversSupportStandardLoopedStreaming

KS category realtime drivers need to support at least standard looped streaming. Other KS category audio drivers need to support standard streaming.

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

To enable user to take advantage of the most efficient lowest latency path and to play audio correctly on the windows platform, the windows audio engine requires:\* KS category realtime drivers to support at least standard looped streaming.\* Other KS category audio drivers to support at least standard streaming.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Sep. 17, 2008<br/> |

 

### Device.Audio.Base.ReportSupportedProperties

The audio driver correctly reports all supported properties

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Requirement Device.Audio.Base.KSPROPERTYAUDIOMIXLEVELTABLE has been merged with this one.

If the audio device and driver support additional properties, the audio driver must report all supported properties correctly to optimize speaker configuration.

If a driver implements support for KSNODETYPE\_SUPERMIX then that node must correctly support the KSPROPERTY\_AUDIO\_MIX\_LEVEL\_TABLE property whose value is a multiple of decibels.

If the driver has analog output, the driver exposes a DAC node in its topology. The driver must then support KSPROPSETID\_Audio and KSPROPERTY\_AUDIO\_CHANNEL\_CONFIG on that node through a filter handle. The driver then correctly reports support for this property (that is, BASIC\_SUPPORT call with KSP\_NODE. \[node ID of DAC\] must succeed) and reports the \_GET and \_SET capabilities. See the Windows Driver Kit, "Streaming Devices."

See the Windows Driver kit, "KSNODETYPE\_SUPERMIX." The decibel values are documented on MSDN.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Sep. 17, 2008<br/> |

 

### Device.Audio.Base.SamplePositionAccuracy

Audio driver reports render sample position with defined accuracy for stream synchronization

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

The Device.Audio.Base.SamplingAccuracy requirement has been merged with this one

HD Audio drivers must be able to report the current position of the buffer being rendered with an accuracy of 0.05 ms, or with frame accuracy (as defined in the HD Audio specification) the current position of the buffer being rendered, in relation to the samples given to the codec. This applies to both the compressed and uncompressed data.

This requirement does not imply that the compressed and uncompressed streams are synchronized. The requirement covers both types of streams but that is the extent of the interaction between the stream types.

For USB audio devices, the required accuracy is 1ms for USB Audio 1.0 implementations and 0.125ms for USB Audio 2.0 implementations.

For all other audio devices, the required accuracy is 1ms.

For all devices, audio sampling position error needs to be less than 0.02 % in order to help accurate echo cancellation when using the device for communication purposes. Sampling rates for capture or render shall be one of the following: 48kHz, 44.1kHz or 16kHz.

For capture and loopback pins, the following additional requirements must be met:

The time stamp indicates the position of the capture stream with respect to the CPU clock. If the time stamp error is too high, then the acoustic echo canceller cannot align the loudspeaker and microphone signal stream very accurately and this can cause echo to appear in VoIP calls.

Time stamp is determined by device streaming positions (DevPos), application streaming position (AppPos) and system performance counter (QPC: query performance counter) by using the IAudioCaptureClient::GetBuffer method. Assuming that the audio stream sampling rate is FS, the time stamp is calculated as: TS=QPC+(AppPos-DevPos)/FS.

The requirements for timestamps are:

Timestamp error needs to be equal to or smaller than the render accuracy listed above.

Timestamp glitch needs to be smaller than 3 glitches per minute

Timestamp drift needs to be smaller than 0.08%

The time stamp error is defined as the difference between the actual time stamp and the time stamp computed based on claimed sampling rate. The maximum time stamp error is defined as the average value of the 1% highest absolute time stamp error.

Timestamp glitch refers to a discontinuity in the audio timestamp with respect to the number of samples given by the driver at the nominal sampling rate. Specifically, if the timestamp difference between two successive calls of IAudioCaptureClient::GetBuffer differs from the number of samples received in the second call (the number of samples is converted to elapsed time based on nominal sampling rate) by more than a threshold, a glitch is said to have happened. The threshold is adaptively calculated based on timestamp error.

Timestamp drift is defined as the difference between CPU clock frequency and device clock frequency. This is measured as a relative quantity with respect to CPU clock rate: Drift = (ActualSamplingFreq/NominalSamplingFrequency) – 1. ActualSamplingFrequency is calculated by applying linear regression analysis on the timestamp value

Additional Information

|                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | To be able to ensure the most accurate synchronization between audio streams and between audio and video streams the position information provided by the audio driver must be accurate. This accuracy will help improve the PC media consumption user experience to the level of Consumer Electronics which is important as the PC moves into the home entertainment space. This requirement also helps real time communication (RTC) features like Automatic Echo Cancellation work better and provide an improved user experience in applications such as Skype and Lync.<br/> |
| Enforcement Date<br/>       | Jun. 26, 2013<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |

 

### Device.Audio.Base.TimeSynchronizedSampleRates

Audio subsystem supports time-synchronized sample rates if both input and output capabilities are present

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

If the built-in or external audio device includes input and output capabilities, the timing relationship between input and output sample rates must remain constant (that is, no drift). For example, if 8 kHz is selected for both input and output sampling rate, audio hardware must ensure that the sampling rate for input and output is precisely matched.Further, when input and output sample rates are set to integer ratios, the actual sample rate ratios must match (that is, no drift). For example, if an 8-kHz input sampling rate and a 32-kHz output sampling rate are selected, the ratio of actual sampling rates must be precisely 8:32. This requirement can be accomplished by ensuring that both input and output sampling rates are derived from the same clock and that sample rate divisors are set correctly.  Design Notes: This requirement helps ensure that AEC and NS algorithms maintain performance and convergence. This requirement does not apply to inputs and outputs where the input source sets a clock such as a digital S/PDIF input.

Additional Information

|                                   |                                                                                                                                                                                                                                                                                                                                                                                           |
|-----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | Full duplex audio is essential to support emerging communications applications such as Internet Protocol (IP) telephony, conferencing, and network gaming. These applications require the audio system to play back and record simultaneously. The following requirements ensure that full duplex operation is available and performance is consistent across implementations.<br/> |
| Enforcement Date<br/>       | Sep. 17, 2008<br/>                                                                                                                                                                                                                                                                                                                                                                  |

 

### Device.Audio.Base.TipRing

Audio jacks must use defined tip/ring or tip/ring/ring connections to ensure proper audio channel path.

|                           |                                                                                                                                                                                           |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                              |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64<br/> Windows 8.1 Client x86, x64<br/> Windows Server 2012 R2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

If the system exposes a multi-channel analog logical device, then each analog output must have independent DAC resource.

The audio jacks must use defined tip/ring connections to ensure proper audio channel path.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left">Audio line in<br/></td>
<td align="left">Left line in<br/></td>
<td align="left">Tip of connector<br/></td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Right line in<br/></td>
<td align="left">Ring of connector<br/></td>
</tr>
<tr class="odd">
<td align="left">Audio line out (front left and right)<br/></td>
<td align="left">Left front out<br/></td>
<td align="left">Tip of connector<br/></td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Right front out<br/></td>
<td align="left">Ring of connector<br/></td>
</tr>
<tr class="odd">
<td align="left">Microphone in (mono)<br/></td>
<td align="left">Microphone in<br/></td>
<td align="left">Tip of connector<br/></td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">4V Bias<br/></td>
<td align="left">Ring of connector<br/></td>
</tr>
<tr class="odd">
<td align="left">Microphone in (stereo)<br/></td>
<td align="left">Left Mic in<br/></td>
<td align="left">Tip of connector<br/></td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Right Mic in<br/></td>
<td align="left">Ring of connector<br/></td>
</tr>
<tr class="odd">
<td align="left">Side surround left and right out<br/></td>
<td align="left">Left surround<br/></td>
<td align="left">Tip of connector<br/></td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Right surround<br/></td>
<td align="left">Ring of connector<br/></td>
</tr>
<tr class="odd">
<td align="left">Rear surround left and right out<br/></td>
<td align="left">Left back<br/></td>
<td align="left">Tip of connector<br/></td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">Right back<br/></td>
<td align="left">Ring of connector<br/></td>
</tr>
<tr class="odd">
<td align="left">Center speaker and LFE (subwoofer) out<br/></td>
<td align="left">Front center out<br/></td>
<td align="left">Tip of connector<br/></td>
</tr>
<tr class="even">
<td align="left"></td>
<td align="left">LFE (subwoofer) out<br/></td>
<td align="left">Ring of connector<br/></td>
</tr>
</tbody>
</table>

 

Design Notes: See the Intel HD Audio Specification, Revision 1.0, and Microsoft HD Audio Pin Configuration Programming Guidelines.

See recommended requirements in the Universal Audio Architecture UAA Hardware Design Guidelines at http://go.microsoft.com/fwlink/?LinkId=50734.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jun. 26, 2013<br/> |

 

### Device.Audio.Base.TwoDMAEnginesAndConnections

Audio device that supports digital output has at least two independent DMA engines and a separate physical connection for digital output using one of the available DMA engines

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

The audio controller that supports digital output must have two independent DMA engines, one that can be used for wave output and the other to make it possible to support AC-3 over S/PDIF at the same time. The digital audio output capability is supported through a separate physical connector identified for digital audio output and used only for digital audio output.Given physical limitations, PC system may have limited input and/or output streams. Secondary HD audio controller in such systems may implement fewer DMA engines. Design Notes: With support for two independent DMA engines, a different signal can be streamed to each connector simultaneously. For example, sending a DVD player application's Dolby Digital stream to the S/PDIF connector while simultaneously sending a voice conversation to the analog connectors. The S/PDIF port needs to be represented as its own audio "device" separate from the analog outputs. Therefore, it will have its own policy configuration, including the preferred data format for a specific signal.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jul. 17, 2008<br/> |

 

### Device.Audio.Base.VolumeControl

Audio driver volume controls are linear and have adequate resolution

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Requirement Device.Audio.Base.VolumeGranularity has been merged with this one.

Signal response (as measured by electrical or digital signal level) changes in linearity with the volume control within 3% tolerance. For example: a volume slider change of 10dB should result in an measured volume change within 10dB + or - 0.3dB

Topology volume nodes must have a resolution equal to or better than 1.5dB and implement driver support for volume level as defined in the Windows Driver Kit.

See the Windows Driver Kit, "KSPROPERTY\_AUDIO\_VOLUMELEVEL” for more details.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Sep. 17, 2008<br/> |

 

### Device.Audio.Base.WAVEFORMATEXTENSIBLESupport

Audio device driver supports WAVEFORMATEXTENSIBLE

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

The audio device driver must support the WAVEFORMATEXTENSIBLE format. Design Notes: Due to the audio system design in Windows and the availability of a Local Effect (LFX) insert in the audio engine we need to ensure consistency and simplification for audio drivers and the format container that they should expect.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Sep. 17, 2008<br/> |

 

### Device.Audio.Base.WaveRTConformance

Audio device is designed to be WaveRT-port-friendly

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                                                                   |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Requirements Device.Audio.Base.IMiniportWaveRTStreamNotification and Device.Audio.Base.WaveRTImplementation have been merged with this one.

Description: A UAA HD Audio-compatible implementation meets this requirement automatically. To be considered WaveRT port friendly, the audio subsystem must support the following:

Cyclic DMA engine with a scatter-gather list.

Ability to split samples between pages.

Ability to loop on buffers without software intervention.

Integrated or discrete audio device driver must be based on the Microsoft Windows WaveRT miniport WDM driver model. Requirement details are defined in the white paper titled "A Wave Port Driver for Real-Time Audio Streaming."

WaveRT drivers must support pull mode audio streaming technology by implementing the IMiniportWaveRTStreamNotification interface. By supporting this functionality in the driver, future Microsoft Windows operating systems will be able to employ more efficient techniques for supplying and retrieving data buffers from the audio device. In turn, this will reduce the overall audio latency on the system.

The legacy ports WaveCyclic or WavePCI are not used to support audio devices on Windows.

Design Notes:

The driver INF will also need to be modified with the following changes to support event notifications:

Use AddReg directive to reference a new add-registry-section to add endpoint property keys. This step can be skipped if such a section already exists. The following example adds a new add-registry-section (HDAudio.EPProperties.AddReg) under HdAudModel.PrimarySpeakerTopo:

\[HdAudModel.PrimarySpeakerTopo\]

AddReg = HDAudio.EPProperties.AddReg

Next, create an add-registry-section, if it does not already exist, to add endpoint property keys to the registry. Example below adds the appropriate property key for the first endpoint declared in this INF:

\[HDAudio.EPProperties.AddReg\]

HKR,"EP\\\\0",%PKEY\_AudioEndpoint\_Association%,,%KSNODETYPE\_ANY%

HKR,"EP\\\\0",%PKEY\_AudioEndpoint\_Supports\_EventDriven\_Mode%,0x00010001,0x1

In the strings section, add the following section for the value of the property keys used in Step 2 above:

PKEY\_AudioEndpoint\_Association = "{1DA5D803-D492-4EDD-8C23-E0C0FFEE7F0E},2"

PKEY\_AudioEndpoint\_Supports\_EventDriven\_Mode = "{1DA5D803-D492-4EDD-8C23-E0C0FFEE7F0E},7"

Please reference Windows Driver Kit documentation for details on writing an INF file.

For more details, see "A Wave Port Driver for Real-Time Audio Streaming" at http://go.microsoft.com/fwlink/?LinkId=40502.

Additional Information

|                                   |                                                                                                                                                                                                                                                                                                                                  |
|-----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Exceptions<br/>             | This requirement does not apply to external or internal USB audio, Bluetooth and 1394 audio devices. If the audio processing is offloaded to hardware, it is acceptable to use the WaveCyclic driver model.<br/>                                                                                                           |
| Business Justification<br/> | This improves reliability of audio drivers by avoiding kernel mode audio processing.<br/> Additionally, Glitch Resilient OS features combined with simple and effective WaveRT drivers running on UAA compliant hardware creates the best possible media playback and recording experience possible on Windows.<br/> |
| Enforcement Date<br/>       | Jul. 17, 2008<br/>                                                                                                                                                                                                                                                                                                         |

 

### Device.Audio.Base.ZeroGlitch

Audio devices do not glitch during multiple simultaneous streaming

|                           |                                                                                                                                                                                                                                        |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Base<br/>                                                                                                                                                                                                           |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64<br/> Windows 8.1 Client x86, x64<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Audio device can support streams in the scenarios below that make it to the output with zero glitches both in audio software and offload hardware during such simultaneous streaming.

Scenarios:

12 simultaneous render streams

5 simultaneous capture streams

3 simultaneous render streams while the CPU is at 100% load

2 simultaneous capture streams while the CPU is at 100% load

Systems must pass this requirement with audio effects enabled, if that is the default configuration for the product

CPU Load for this requirement is created using the Real World Stress Tool and sets the CPU load to 100% at thread priority 8.

All streams will be rendered using the default mix format for the device.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jun. 26, 2013<br/> |

 

## Device.Audio.Bluetooth


This audio device uses the Bluetooth Audio Driver.

|                                 |                                                                                                                                                         |
|---------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| Related Requirements<br/> | Device.Audio.Bluetooth.AtleastOneProfileSupport<br/> Device.Audio.Bluetooth.DriverReqs<br/> Device.Audio.Bluetooth.HCIDisconnect<br/> |

 

### Device.Audio.Bluetooth.AtleastOneProfileSupport

Bluetooth Audio Device needs to support at least one of the below profiles.

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Bluetooth<br/>                                                                                                                                                                                                                                              |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Requirements Device.Audio.Bluetooth.AutomaticReconnectAttempt, Device.Audio.Bluetooth.ConnectDisconnectBluetooth, Device.Audio.Bluetooth.HandsFreeCallControl, and Device.Audio.Bluetooth.MajorMinorClassID have been merged with this one

The Bluetooth Audio Device must be Bluetooth SIG compliant in at least one of the following profiles:

A2DP profile as defined in the “Advanced Audio Distribution Profile version 1.2” (A2DP\_SPEC\_V12) Bluetooth SIG specification.

Hands-Free as defined in the “Hands-Free Version 1.5” (HFP 1.5\_SPEC\_V10) Bluetooth SIG specification.

AVRCP as defined in the “Audio/Video Remote Control Profile Version 1.3” (AVRCP\_SPEC\_V13) Bluetooth SIG specification.

Special attention should be made to the following points in the Bluetooth SIG specifications:

The reconnection method must follow the appropriate connection procedures for connection to an Audio Gateway

Bluetooth audio devices must expose the proper Major and Minor Class of Device identifier. The values chosen must accurately reflect the form factor and primary usage of the device.

For A2DP devices, class of device ID is defined in Section 5.3 "SDP Interoperability Requirements" of the Advanced Audio Distribution Profile Specification “A2DP\_SPEC\_V12" document.

For Hands-Free devices, class of device ID is defined in Section 5.5.1 "Class of Device" of the Hands-Free Profile Specification version 1.5 in the "HFP 1.5\_SPEC\_V10" document.

There are a few additional Microsoft specific requirements for Bluetooth:

Bluetooth audio devices support the properties required for Sound Control Panel to control their connection and disconnection. More info at http://msdn.microsoft.com/library/ff537446(VS.85).aspx. KSPROPSETID\_BtAudio needs to support both:

KSPROPERTY\_ONESHOT\_DISCONNECT

KSPROPERTY\_ONESHOT\_RECONNECT

3rd parties who create Hands-Free device drivers and opt to use the Bluetooth Call Control platform API/DDI must follow the details, usage, and implemenation in the document entitled, “Call Control Platform API/DDI” which can be found on http://msdn.microsoft.com.

Additional Information

|                                   |                                                                                                                                                                                                                                                                                    |
|-----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | • Bluetooth SIG compliance allows for the display and usage of the Bluetooth icon and name. This is important for consumer device branding recognition.<br/> • Assured compatibility with OS supplied components that rely on Bluetooth SIG defined functionality<br/> |
| Enforcement Date<br/>       | Jun. 26, 2013<br/>                                                                                                                                                                                                                                                           |

 

### Device.Audio.Bluetooth.DriverReqs

Bluetooth Audio Device Driver Requirements

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Bluetooth<br/>                                                                                                                                                                                                                                              |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Bluetooth SIG QualificationThe Bluetooth Audio driver must pass the necessary Bluetooth SIG Qualification tests required by the Bluetooth SIG for the profiles listed in the "Bluetooth Profiles" section above.

HID Call ControlThe Bluetooth Audio driver must map the Hands-free call control information to the appropriate HID Call Control messages as defined in the "Windows 7 HID Call Control" specification.

Volume Change NotificationIf volume change notifications are received from the hands-free profile that indicate the volume level of the Bluetooth audio device has changed, the driver must inform the OS of the volume change, consistent with Section 4.28 of the Bluetooth audio Hands-Free specification, "HFP 1.5\_SPEC\_V10." Design Notes: Bluetooth Profiles and SIG QualificationThe Bluetooth Audio Profile documentation is maintained by the Bluetooth SIG.  The Bluetooth SIG Qualification is owned and defined by the Bluetooth SIG. Qualification is a necessary pre-condition of the necessary intellectual property license for the Bluetooth wireless technology. Detailed information can be found on the Bluetooth SIG's website at http://www.bluetooth.org.Volume Change NotificationThe KSEVENTSETID\_AudioControlChange is used by the Bluetooth audio driver to notify the OS that the Bluetooth audio device volume level has changed. Not all Bluetooth Hands-free devices will notify the driver of volume changes made by the user. For those that do, the Bluetooth audio driver must use this event to notify the OS of the change. Note that this is not to be used for AVRCP volume notifications as those volume change notifications are handled by the OS. Additional information on KSEVENTSETID\_AudioControlChange can be found at http://msdn.microsoft.com

Additional Information

|                                   |                                                                                                                                                                                                                                                                                                                                                                                                             |
|-----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | The requirements listed here are necessary to provide support for the basic audio functionality included in Windows for Bluetooth audio devices. This functionality has been implemented in the Windows Bluetooth audio class driver and it is important that 3rd party Bluetooth audio drivers comply with required functionality such that the basic Windows audio features function properly.<br/> |
| Enforcement Date<br/>       | Jun. 01, 2009<br/>                                                                                                                                                                                                                                                                                                                                                                                    |

 

### Device.Audio.Bluetooth.HCIDisconnect

Bluetooth Audio Devices must complete an HCIDisconnect before powering down

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.Bluetooth<br/>                                                                                                                                                                                                                                              |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

This step is required to allow for timely notification to the system that the device is no longer available. This is needed in order to reroute audio to an alternate audio sink seamlessly when the Bluetooth audio device is turned off providing for a good end user experience.

Additional Information

|                                   |                                                                                                                                                                                                                                                                                                                                                                           |
|-----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | This is needed in order for our stream routing mechanism to function in a timely manner. ScenarioUser is listening to music on desktop speakers. They turn on their BT Headphones. Music is automatically routed to the BT headphones. They then turn off their BT headphones. Music is automatically routed 'in a timer manner' back to the desktop speakers.<br/> |
| Enforcement Date<br/>       | Jun. 01, 2009<br/>                                                                                                                                                                                                                                                                                                                                                  |

 

## Device.Audio.HardwareAudioProcessing


HardwareAudioProcessing

|                                 |                                                                                                                                  |
|---------------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| Related Requirements<br/> | Device.Audio.HardwareAudioProcessing.AudioHardwareOffloading<br/> Device.Audio.HardwareAudioProcessing.ETWEvent<br/> |

 

## Device.Audio.HardwareAudioProcessing.AudioHardwareOffloading


Hardware that supports offloaded audio render processing meets this requirement

|                           |                                                                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.HardwareAudioProcessing<br/>                                                                                                                                              |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

The requirement Device.Audio.HardwareAudioProcessing.IMiniport.xml has been merged with this one.

If a hardware solution supports offloaded audio render processing, the driver must expose a KS filter and a single KSNODETYPE\_AUDIO\_ENGINE node with appropriate pin factories connected.

If a hardware solution supports the offloading of audio render processing, mixing, or decoding, the driver must expose a KS filter. For each rendering path through that filter that supports hardware offloading the driver must expose a single KSNODETYPE\_AUDIO\_ENGINE node, connecting directly to only the following pin factories:

two KS sink pin factories

a single KS source pin factory for reference stream support

If a driver exposes a KSNODETYPE\_AUDIO\_ENGINE node, the driver and hardware must support base-level functionality.

If a driver exposes a KSNODETYPE\_AUDIO\_ENGINE node, the driver and hardware must support the following capabilities:

Audio mixer with at least 3 simultaneous inputs (2 offload and 1 host process)

Volume and mute capabilities both pre- and post-mixing

Metering reporting (support for querying per-stream peak values, both pre & post-mix)

For stream metering (pre-mixing), metering levels should be reported after the LFX and before volume control

For endpoint metering (post-mixing), metering levels should be reported:

Before volume control and GFX, when the GFX is an encoder

After the GFX and before volume control, when the GFX is not an encoder

Reference stream (support for sending the audio stream post-mix back to the Windows audio stack)

The reference stream provided should be the final output to the audio device, or, if encoding is taking place, just prior to encoding.

If a driver exposes a KSNODETYPE\_AUDIO\_ENGINE node, the driver must support KSPROPSETID\_AudioEngine with certain properties.

If a driver exposes a KSNODETYPE\_AUDIO\_ENGINE node, the driver must support KSPROPSETID\_AudioEngine with the following properties:

KSPROPERTY\_AUDIOENGINE\_LFXENABLE

KSPROPERTY\_AUDIOENGINE\_GFXENABLE

KSPROPERTY\_AUDIOENGINE\_MIXFORMAT

KSPROPERTY\_AUDIOENGINE\_DEVICEFORMAT

KSPROPERTY\_AUDIOENGINE\_SUPPORTEDDEVICEFORMATS

KSPROPERTY\_AUDIOENGINE\_DESCRIPTOR

KSPROPERTY\_AUDIOENGINE\_WAVERT\_CURRENT\_WRITE\_POSITION

KSPROPERTY\_AUDIOENGINE\_BUFFER\_SIZE\_RANGE

KSPROPERTY\_AUDIOENGINE\_LOOPBACK\_PROTECTION

KSPROPERTY\_AUDIOENGINE\_VOLUMELEVEL

KSPROPERTY\_AUDIO\_VOLUMELEVEL

KSPROPERTY\_AUDIO\_MUTE

KSPROPERTY\_AUDIO\_PEAKMETER2

KSPROPERTY\_AUDIO\_PRESENTATION\_POSITION

If a driver exposes a KSNODETYPE\_AUDIO\_ENGINE node, the driver must expose certain pin factories.

If a driver exposes a KSNODETYPE\_AUDIO\_ENGINE node, the driver must expose the following pin factories:

Host process pin factory

Must support only a single instance

Offload pin factory

Must support at least two instances

Loopback pin factory

Must support at least a single instance

In addition, the following must be met:

Loopback pins must:

Have a “Possible Global Instances” of at least 1

Support at least 1 instance regardless of what else is going on in the system

To enable scenarios like cross-fade, offload-capable endpoints must support 1 loopback pin instance + 1 host pin instance + each of the following in isolation, assuming no other offload endpoints are being used at the time:

Any required PCM format + Any required PCM format (the same, or different)

The loopback pin must support

The HW mix format

The device format (which can be publically queried from the endpoint property store)

If a hardware solution supports offloaded audio render processing, the same functionality provided in hardware (e.g., processing, effects, etc.) must be available in software as well.

In order to provide a consistent user experience and prevent confusion when a user enables or configures functionality that exists in only hardware or only software, the capabilities provided must be equal in both hardware and software.

If a driver exposes a KSNODETYPE\_AUDIO\_ENGINE node, the driver must support streaming specific PCM formats.

If a driver exposes a KSNODETYPE\_AUDIO\_ENGINE node, the driver must support streaming the following PCM formats on the offload pins:

Sampling rates:

8 kHz

11.025 kHz

16 kHz

22.050 kHz

32 kHz

44.1 kHz

48 kHz

88.2 kHz

96 kHz

Bit Depth:

16-bit

Channel configurations of 1.0, 2.0, and 5.1

If hardware supports offloaded audio render processing, the steady-state latency for real-time PCM audio must be less than 20 ms.

If hardware supports offloaded audio render processing, the steady-state latency (as measured between the render KS endpoint and the capture KS endpoint on the same device with all processing disabled and the smallest supported buffer sizes being used) must be less than 20 ms.

If a hardware solution supports offloaded audio render processing, the startup latency must be less than 15ms for PCM.

If hardware supports offloaded audio render processing, the startup latency (as defined as the time between just before KSCreatePin and the audio play position beginning to advance) must be less than 15ms for PCM.

If a hardware solution supports offloaded audio render processing, the hardware must support certain buffer sizes.

If a hardware solution supports offloaded audio render processing, the hardware must support buffer sizes:

As large as (or larger than) 1 second

As small as (or smaller than) 10 milliseconds

Times above assume an audio format of 2 channels, 48 kHz, 16-bit PCM.

If a hardware solution supports offloaded audio render processing, the pause or stop latency must be less than 10ms.

If a hardware solution supports offloaded audio render processing, the pause or stop latency (as measured between a pause/stop command and the audio pausing/stopping) must be less than 10ms.

The CPU consumption by an audio driver must be less than 5% and memory usage must be less than 100MB.

An audio driver must not consume more than 5% of the total CPU processing available and must not consume more than 100MB of system RAM.

Systems that support connected standby must support certain codecs and processing capabilities.

In order to ensure a high-quality user experience on systems that support connected standby where the in-box Windows codecs may be unavailable, the follow codecs and processing functionality are required:

Sample rate converter

All processing functionality provided must be exposed via support for the corresponding KS properties via the Portcls WaveRT driver.

Other Considerations

Offloaded audio devices must accept and properly react to end of segment (EOS) communication from the operating system.

If a hardware solution supports offloaded audio render processing, the driver must implement IMiniportAudioEngineNode and IMiniportStreamAudioEngineNode

IMiniportAudioEngineNode contains a list of methods related to the offload KS properties targeting the audio engine node via KS filter handle. A miniport driver's WaveRT miniport class needs to inherit not only from IMiniportWaveRT interface, it also needs to inherit IMiniportAudioEngineNode interface and implement all the defined methods.

IMiniportStreamAudioEngineNode contains a list of methods related to the offload KS properties targeting the audio engine node via pin instance handle. A miniport driver's WaveRT miniport class needs to inherit not only from IMiniportWaveRTStreamNotification interface, it also needs to inherit IMiniportStreamAudioEngineNode interface and implement all the defined methods.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jun. 26, 2013<br/> |

 

## Device.Audio.HardwareAudioProcessing.ETWEvent


If a hardware solution supports offloaded audio render processing, then the driver must raise an ETW event to report glitches detected by the hardware audio engine.

|                           |                                                                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.HardwareAudioProcessing<br/>                                                                                                                                              |
| Applies to<br/>     | Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

The audio driver needs to raise an Event Tracing for Windows (ETW) event to report glitches detected by the HW Audio Engine. This event should at least include the reason of the glitching and the DMA buffer information.The following events are defined for the miniport to reports events through Portcls interface callbacks. typedef enum {    eMINIPORT\_IHV\_DEFINED = 0,     eMINIPORT\_BUFFER\_COMPLETE,    eMINIPORT\_PIN\_STATE,    eMINIPORT\_GET\_STREAM\_POS,    eMINIPORT\_SET\_WAVERT\_BUFFER\_WRITE\_POS,    eMINIPORT\_GET\_PRESENTATION\_POS,    eMINIPORT\_PROGRAM\_DMA,    eMINIPORT\_GLITCH\_REPORT} ePcMiniportEngineEvent;

|                                                               |                                           |                                                                    |                                                                                                              |                                                      |
|---------------------------------------------------------------|-------------------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|------------------------------------------------------|
| Event type<br/>                                         | Parameter 1<br/>                    | Parameter 2<br/>                                             | Parameter 3<br/>                                                                                       | Parameter 4<br/>                               |
| IHV specific event types(defined and used by IHVs)<br/> | Defined and used by IHVs<br/>       | Defined and used by IHVs<br/>                                | Defined and used by IHVs<br/>                                                                          | Defined and used by IHVs<br/>                  |
| Buffer complete<br/>                                    | Current linear buffer position<br/> | Current WaveRtBufferWritePosition<br/>                       | Data length completed<br/>                                                                             | 0<br/>                                         |
| Pin State<br/>                                          | Current linear buffer position<br/> | Current WaveRtBufferWritePosition<br/>                       | 0-&gt;KS\_STOP1-&gt;KS\_ACQUIRE2-&gt;KS\_PAUSE3-&gt;KS\_RUN<br/>                                       | 0<br/>                                         |
| Get stream position<br/>                                | Current linear buffer position<br/> | Current WaveRtBufferWritePosition<br/>                       | 0<br/>                                                                                                 | 0<br/>                                         |
| Set WaveRt buffer write position<br/>                   | Current linear buffer position<br/> | Current WaveRtBufferWritePosition received from portcls<br/> | Target WaveRtBufferWritePosition received from portcls<br/>                                            | 0<br/>                                         |
| Get Presentation Position<br/>                          | Current linear buffer position<br/> | Current WaveRtBufferWritePosition<br/>                       | Presentation position<br/>                                                                             | 0<br/>                                         |
| Program DMA<br/>                                        | Current linear buffer position<br/> | Current WaveRtBufferWritePosition<br/>                       | Starting  WaveRt buffer offset<br/>                                                                    | Data length<br/>                               |
| Glitch detection<br/>                                   | Current linear buffer position<br/> | Current WaveRtBufferWritePosition<br/>                       | 1:WaveRT buffer under run2:decoder errors3: receive the same wavert buffer write pos two in a row<br/> | When it's 3, the offending write position<br/> |

 

  

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Aug. 08, 2011<br/> |

 

## Device.Audio.HDAudio


This audio device uses the HD Audio Driver.

|                                 |                                                                                                                                                                                                         |
|---------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Related Requirements<br/> | Device.Audio.HDAudio.HDAudioCodecAdditionalReqs<br/> Device.Audio.HDAudio.HDAudioSpecCompliance<br/> Device.Audio.HDAudio.HDMIDCN<br/> Device.Audio.HDAudio.INFHasDeviceID<br/> |

 

### Device.Audio.HDAudio.HDAudioCodecAdditionalReqs

HD Audio codec supports additional requirements not specified in the Intel High Definition Audio specification

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.HDAudio<br/>                                                                                                                                                                                                                                                |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

The following requirements have been merged with this one:

Device.Audio.HDAudio.PnPCodecDeviceID

Device.Audio.HDAudio.PinConfigPortConnectivity

Device.Audio.HDAudio.UniqueSequenceNumbers

Device.Audio.HDAudio.OneCodecPortOneConnector

Device.Audio.HDAudio.DefaultAssociationNotZero

Device.Audio.Base.HDAudioRemoveDevicePowerState

To be UAA compliant, an HD Audio codec must implement the following features, which are not necessarily required by Intel High Definition Audio Specification:

Speaker compensation is the only valid scenario for audio signal processing of an audio stream by a codec, and then it is valid only if the speakers are hardwired to the pin complex that contains the processing node (such as integrated laptop speakers). This requirement does not apply to decryption of protected audio streams.

When all of an HDAudio codec's widgets are configured in the benign processing state, the codec performs no nonlinear or time-variant processing on the audio streams that pass through it.

Software must be able to set all processing nodes to the benign processing state, and the codec must function according to UAA baseline requirements while in this state.

An HDAudio codec must be accessible only through the HDAudio bus controller. The codec must not expose registers or other hardware mechanisms that are accessible through either memory or I/O address space. This requirement does not encompass HDMI or DisplayPort. For HDMI or DisplayPort, please refer to the the HD audio HDMI DCN.

Modem and audio functionality must not be combined. Although the same piece of silicon can house both modem and audio devices, the functions must be separate devices and must not share any software or hardware resources (such as ADCs or DACs).

When the HD Audio link is in a running state (HD Audio controller is in D0), UAA-compliant HD Audio codecs must respond to commands even when powered down in all required device power-management states. In effect, the digital section of the codec must remain powered.

Codecs must respond to a verb even if addressed at a nonexistent widget or if the verb itself is invalid.

Function group nodes must have node IDs in the range 0 to 127. This restriction does not apply to node IDs for widget nodes.

In a system with one or more HDAudio codecs, the system BIOS must initialize the Configuration Default Register for each codec pin widget based on the system configuration/implementation of the HD Audio codec while considering the Microsoft Pin Configuration Programming Guidelines so that the UAA HDAudio function class driver's topology parser can create a functional device topology for the codec. The default data in the HD Audio codec pin configuration registers must not misrepresent the hardware capabilities, and the Configuration Default Registers must not be null (all zeros).

A function group in an HDAudio codec must expose a nonzero subsystem ID. The BIOS overwrites the subsystem ID if necessary. If the BIOS cannot program the subsystem ID or if it does so incorrectly, the hardware must supply a default, vendor-specific subsystem ID.

HD Audio codecs must comply with the Plug and Play requirements for proper identification that are described in Plug and Play Guidelines for High Definition Audio Devices, "HD Audio Codec." (See Guidelines at http://www.microsoft.com/whdc/device/audio/HD-aud\_PnP.mspx)

A pin widget's port connectivity value of 0x01 (No Connection) is valid only when a system in which the HD Audio codec resides has no jack or integrated device attached to the pin widget. A port connectivity setting of 0x02 (10b) should be used only in those cases where a trace on a circuit board directly connects the codec and an integrated device such as a speaker amplifier or microphone. A port connectivity setting of 0x03 (011b) is specifically disallowed. Each pin widget must connect to a single audio endpoint.

In the data configured by the BIOS or in the default values from the codec manufacturer, the sequence numbers within the pin configuration register's default association must be unique within the same association except for association 0xf, in which all instances should support Sequence ==0. (See Pin Configuration Guidelines for High Definition Audio Devices, at http://go.microsoft.com/fwlink/?LinkId=58572.)

Each HD Audio codec port connects to one and only one audio source, destination, or jack. For compatibility with the UAA class driver do not double-up on input or output ports in ways that cannot be exposed to the class driver through the information in the pin configuration registers. Designs that use GPIOs under control of third-party function drivers must default to an appropriate hardware configuration when the UAA class driver is loaded.

Values in the Default Association field of the HD Audio codec pin configuration register are not set to zero (reserved value)

HD Audio Codec Driver Must Not Leave Function Group in D3Cold State Upon Unload. By the exit of the IRP handler for IRP\_MJ\_PNP/IRP\_MN\_REMOVE\_DEVICE, an HD Audio Codec driver must have

Remembered or discovered the current power state of the function group and

If that current function group power state was D3 Cold, the driver must have changed it to a different power state. The function group power state upon exit is required to be D3.

There are some exceptions for feature number 13:

Combination jacks (headphone/S/PDIF) are allowed if the digital output is exposed as a separate, independent always on device using the HD Audio pin configuration register values and the analog section of the jack supports jack presence detection.

Combination jacks that have both a speaker and a microphone are also acceptable provided the connector supports microphone and speaker jack presence detection.

There is another exception to this requirement with regards to an audio device pin that feeds two different connectors intended for SPDIF protocol content. In the case where a system or device exposes an RCA jack (Co-ax) and an optical output for the SPDIF protocol stream from one codec pin this is permitted only if the audio driver exposes the pin as outlined in the design note section below

It is also acceptable to build a system that has two headphone jacks fed by the same HD Audio pin.

There are some extra design notes also associated with feature 13:

An array of jack descriptions can also be used to show that a pair of jacks is equivalent. The following example would indicate to the user that the yellow RCA jack and the black “digital optical” jack will carry the same signal:

KSJACK\_DESCRIPTION ar\_SPDIF\_Jacks\[\] =

{

// jack 1

{

(SPEAKER\_FRONT\_LEFT | SPEAKER\_FRONT\_RIGHT), // ChannelMapping (L,R)

RGB(255,255,0), // Color (yellow)

eConnTypeRCA, // ConnectionType (RCA)

eGeoLocRear, // GeoLocation

eGenLocPrimaryBox, // PortConnection

TRUE // IsConnected

},

// jack 2

{

(SPEAKER\_FRONT\_LEFT | SPEAKER\_FRONT\_RIGHT), // (L,R)

RGB(0,0,0), // (black)

eConnTypeOptical, // (optical)

eGeoLocRear,

eGenLocPrimaryBox,

TRUE

}

};

Clarification: This exception has nothing to do with HDMI Audio, it only covers SPDIF on two physically different SPDIF connectors and this exception does NOT allow HDMI Audio outputs to share a codec pin with SPDIF. That is still prohibited.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jun. 26, 2013<br/> |

 

### Device.Audio.HDAudio.HDAudioSpecCompliance

HD Audio codec for audio complies with the Intel High Definition Audio specification

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.HDAudio<br/>                                                                                                                                                                                                                                                |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Requirements Device.Audio.HDAudio.CopyBitPolarityClarification, Device.Audio.HDAudio.LowPowerDCN, have been merged with this one.

If the codec is for an audio implementation, it must be implemented according to Intel High Definition Audio Specification, Revision 1.0, and updated when commercially possible to comply with HD Audio specification DCNs.

Although the implementation must comply with all DCNs, particular attention should be made to the following:

HD Audio devices that expose a digital output must meet HD audio design change notification "Copy Bit Clarification". Refer to http://download.intel.com/design/chipsets/hdaudio/HDA041-A\_DCN\_-\_Copy\_Bit\_Polarity\_Clarification\_rev1p0.pdf

An HD audio Low-Power Design Change Notification (DCN) compatible HD Audio 1.0 based codec implements Low-Power capabilities according to the Low-Power specification and Microsoft UAA Hardware Design Guidelines. See the RAND licensed Intel HD Audio specification, the HD Audio Low-Power DCN amendment to that specification and the Microsoft UAA Hardware Design Guidelines

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jun. 26, 2013<br/> |

 

### Device.Audio.HDAudio.HDMIDCN

If hardware supports multi-channel HDMI or DisplayPort audio consistent with the method defined by HD Audio, then the hardware must comply with the HD Audio HDMI Design Change Notifications (DCN).

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.HDAudio<br/>                                                                                                                                                                                                                                                |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Requirements Device.Audio.HDAudio.2AudioChannelsForHDMIorDisplayPort and Device.Audio.HDAudio.HDMIKSPROPERTYJACKSINKINFO have been merged with this one.

If hardware supports multi-channel HDMI or DisplayPort audio consistent with the method defined by HD Audio, then the hardware must comply with the HD Audio HDMI Design Change Notifications (DCN).

If hardware supports HDMI or DisplayPort audio and implements any of the verbs listed below, the hardware must comply with the following HD Audio DCNs:

HDA034-A2: HDMI Content Protection and Multi-Channel Support

HDA039-A: HDMI/ELD Memory Structure

HDA036-A: DisplayPort Support and HDMI Miscellaneous Corrections

If hardware supports HDMI or DisplayPort audio, implements any of the verbs listed below and supports the transmission of high bit-rate (HBR) formats, the hardware must comply with the HD Audio DCN HDA035-A: HDMI High Bit Rate Support.

Verbs:

F2Fh (Get HDMI ELD Data)

F2Dh (Get Converter Channel Count)

72Dh (Set Converter Channel Count)

F2Eh (Get HDMI Data Island Packet – Size Info)

72Eh (Set HDMI Data Island Packet – Size Info)

F30h (Get HDMI Data Island Packet – Index)

730h (Set HDMI Data Island Packet – Index)

F31h (Get HDMI Data Island Packet – Data)

731h (Set HDMI Data Island Packet – Data)

F32h (Get HDMI Data Island Packet – Transmit-Control)

732h (Set HDMI Data Island Packet – Transmit-3Control)

F33h (Get Content Protection Control)

733h (Set Content Protection Control)

F34h (Get Converter Channel to HDMI Slot Mapping)

734h (Set Converter Channel to HDMI Slot Mapping)

Audio drivers that expose HDMI or DisplayPort endpoints must support the KSPROPERTY\_JACK\_SINK\_INFO property. For every endpoint exposed by an audio driver that supports HDMI or DisplayPort audio, the driver must respond to a KSPROPERTY\_JACK\_SINK\_INFO request with a KSJACK\_SINK\_INFORMATION structure. The structure shall be correctly populated.

Display adapter or chipset with HDMI audio or DisplayPort audio capabilities must implement two channel audio support that is compliant with the HD Audio specification

A display subsystem on a platform that does not support connected standby but supports HDMI audio or DisplayPort audio capabilities must implement a minimum of two channel audio support compliant with HD Audio specification.

The minimum requirement is to use an HD Audio compliant solution exposing an SPDIF Output with a static format support of Stereo PCM, 16bit depth with sampling rate of 44.1kHz and 48kHz.

HDMI endpoints do not have to be based on HD Audio if they are a part of Systems that support connected standby.

Additional information on how to expose an SPDIF Output in an HD Audio compliant controller/codec configuration can be found in the Intel HD Audio specification.

Expose the logical independent HDMI Audio or DisplayPort audio device as outlined below to be exposed as an HDMI Audio device in Windows:

Intel HMDI Audio HD Audio Spec ECR:

Pin complex.PinCaps.HdmiCapable == 1,

AND PinConfig.DefDevice = DigitalOtherOut (0x5)

General/Geometric location irrelevant here

Intel HD Audio 1.0 method:

Pin config general location is internal (1)

AND geometric location is “Special1” (0x8)

AND PinConfig.DefDevice = DigitalOtherOut (0x5)

Pincaps.HdmiCapable is irrelevant here.

Also, see the UAA Hardware Design Guidelines available at http://go.microsoft.com/fwlink/?linkid=50734.

(Added additonal information on how to expose an S/PDIF Output in an HD Audio compliant controller)

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jun. 26, 2013<br/> |

 

### Device.Audio.HDAudio.INFHasDeviceID

INF file for HD Audio codec includes properly formatted device ID string for each supported codec device

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.HDAudio<br/>                                                                                                                                                                                                                                                |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Vendors that supply custom HD Audio function drivers must include an INF file that follows guidelines for device identification strings that are defined in Plug and Play Guidelines for High Definition Audio Devices, "INF Files for HD Audio Codecs." Design Notes: See Guidelines at http://www.microsoft.com/whdc/device/audio/HD-aud\_PnP.mspx.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jul. 17, 2008<br/> |

 

## Device.Audio.UAACompliance


This audio device uses HD Audio, Bluetooth, or USB Audio Drivers

|                                 |                                           |
|---------------------------------|-------------------------------------------|
| Related Requirements<br/> | Device.Audio.UAACompliance.UAA<br/> |

 

### Device.Audio.UAACompliance.UAA

Audio device is compliant with one of the appropriate technology specifications supported by the UAA initiative

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.UAACompliance<br/>                                                                                                                                                                                                                                          |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Requirements Device.Audio.Base.DevicesWorkWithoutExtraSoftware, Device.Audio.Base.VoiceCommunicationUAA, device.audio.UAACompliance.TestUsingBluetoothClassDriver, and system.fundamentals.systemaudio.3rdpartydriver have been merged with this one.

An audio device must comply with the appropriate standard as supported by the Microsoft Universal Audio Architecture Initiative. The supported standards are USB Audio, IEEE 1394 Audio, Bluetooth Audio (Bluetooth devices (e.g. headset, speakers) need to use Windows Bluetooth Audio Class drivers for certification.) and High Definition Audio. The relevant Windows audio class driver loads, runs, and passes functionality tests on the implementation. This includes meeting minimum performance requirements as defined in the Microsoft UAA Hardware Design Guidelines.

This requirement does not apply to systems that support connected standby or devices that support USB Audio 2.0.

See "Universal Audio Architecture" at http://go.microsoft.com/fwlink/?LinkId=40631.

See "USB Audio Devices and Windows" at http://go.microsoft.com/fwlink/?LinkId=40632.

Additional details:

UAA audio devices must meet basic functionality requirements following a new Windows installation and prior to the installation of any additional software (drivers, system services or applications). When running exclusively with the built-in Windows support, audio devices as a minimum shall:

Correctly render stereo sound from built-in speakers

Correctly render mono sound from mono render devices

Correctly transmit a stereo sound signal through line output connectors

Correctly capture a stereo line-in signal

Correctly capture a stereo mic-in signal

Correctly capture a mono sound from mono capture devices

Correctly support, Mute, Volume Control

Identical functionality must also be supported with any custom driver provided with the device.

If the physical design implements line-in and/or mic-in, then line-in and/or mic-in should work with class drivers in Windows.

This requirement checks the interaction of the UAA compatible devices with the class driver and insures it is equivalent on basic functionality to that provided by third party drivers.

UAA class drivers support:

HD Audio

High Definition Audio Specification Revision 1.0.

USB Audio 1.0

Universal Serial Bus Device Class Definition for Audio Devices Release 1.0

Universal Serial Bus Device Class Definition for Audio Data Formats Release 1.0

Universal Serial Bus Device Class Definition for Terminal Types Release 1.0

Universal Serial Bus Device Class Definition for MIDI Devices Release 1.0

Hardware mute and volume controls if implemented must be compatible with Windows class drivers. In particular:

HD Audio hardware volume controls if implemented must be designed as amplifier widgets, and not as HD Audio volume knob widgets. See HD Audio spec sections 7.3.3.7 "Amplifier Gain/Mute", 7.3.4.10 "Amplifier Capabilities", and not 7.3.3.29 "Volume Knob".

HD Audio mute is implemented many ways in the class driver. If an amplifier widget has the "mute capable" bit set, sending a mute control down must mute the signal path through that amplifier widget. See HD Audio spec sections 7.3.3.7 "Amplifier Gain/Mute" and 7.3.4.10 "Amplifier Capabilities". If a pin widget has "input capable" or "output capable" set, setting "input enable" or "output enable" to 0 must mute the signal path through that pin widget. See HD Audio spec sections 7.3.3.13 "Pin Widget Control" and 7.3.4.9 "Pin Capabilities." Setting "digital enable" bit to 0 on a digital converter must mute the signal path through that digital converter. See HD Audio spec sections 7.3.3.9 "Digital Converter Control" and 7.3.4.6 "Audio Widget Capabilities."

USB hardware volume controls if implemented must be designed as the proper set of descriptors and associated command responses. Refer to USB Audio Specification 1.0, Mute Control and Volume Control as defined in sections 5.2.2.4.3.1 and 5.2.2.4.3.2.

Voice Communications:

Voice communication devices must expose themselves to the operating system as Universal Audio Architecture (UAA)-compliant audio devices. The devices must include an appropriate communication-centric form factor, such as a headset or handset, that Windows® can recognize and support.

Webcams that have a microphone expose a microphone form factor device by using USB descriptors according to the USB Audio 1.0 specification.

Aggregate USB audio devices (that is, audio devices that have input and output on the same device) expose themselves to Windows as handset or headset device types by using USB descriptors according to the USB Audio 1.0 specification.

For integrated and PCI audio devices that have analog jacks, the jacks are exposed accurately by using the pin configuration registers and driver topology. The driver topology uses relevant KSNODETYPE descriptors.

There are two options to identify devices as communication-class devices for audio testing with Windows.

Option 1:

Audio endpoint devices of certain KSNODETYPE descriptors are automatically treated as communication devices for testing purposes. Custom drivers should map to one of these KSNODETYPEs for the device to be recognized as a communication-class device. The following list is a full list of communication-class KSNODETYPE descriptors:

KSNODETYPE\_MICROPHONE

KSNODETYPE\_DESKTOP\_MICROPHONE

KSNODETYPE\_PERSONAL\_MICROPHONE

KSNODETYPE\_OMNI\_DIRECTIONAL\_MICROPHONE

KSNODETYPE\_MICROPHONE\_ARRAY

KSNODETYPE\_PROCESSING\_MICROPHONE\_ARRAY

KSNODETYPE\_COMMUNICATION\_SPEAKER

KSNODETYPE\_HANDSET

KSNODETYPE\_HEADSET

KSNODETYPE\_SPEAKERPHONE\_NO\_ECHO\_REDUCTION

KSNODETYPE\_ECHO\_SUPPRESSING\_SPEAKERPHONE

KSNODETYPE\_ECHO\_CANCELLING\_SPEAKERPHONE

KSNODETYPE\_PHONE\_LINE

KSNODETYPE\_TELEPHONE

KSNODETYPE\_DOWN\_LINE\_PHONE

Microsoft® class drivers map device types to these KSODETYPE descriptors based on information from device hardware or firmware. For example, the Microsoft USB Audio class driver directly maps the USB Audio terminal types that are defined in tables 2-2, 2-4, and 2-5 of the Universal Serial Bus Device Class Definition for Terminal Types, Revision 1.0, March, 1998 to the corresponding KSNODETYPE descriptors above, with three exceptions that do not clearly imply a communication function. These exceptions are the following:

|                                     |                   |                |                                                    |
|-------------------------------------|-------------------|----------------|----------------------------------------------------|
| Terminal Type<br/>            | Code<br/>   | I/O<br/> | Description<br/>                             |
| Input Undefined<br/>          | 0x0200<br/> | I<br/>   | Input terminal, undefined type<br/>          |
| Bi-directional Undefined<br/> | 0x0400<br/> | I/O<br/> | Bi-directional terminal, undefined type<br/> |
| Telephony Undefined<br/>      | 0x0500<br/> | I/O<br/> | Telephony terminal, undefined type<br/>      |

 

To see the Universal Serial Bus Device Class Definition for Terminal Types, Revision 1.0, March, 1998, visit the following website:

http://www.usb.org/developers/devclass\_docs/termt10.pdf

Communication-class USB audio device manufacturers must use one of the mapped terminal types to be tested against communication class requirements and to be used correctly in Windows.

Other drivers may choose different mapping criteria. As long as they map to a KSNODETYPE descriptor that is listed above, the drivers will be considered communication-class during testing. For information on expressing KSNODETYPE descriptors in a WDM driver, see the following website:

http://msdn.microsoft.com/library/ms790325.aspx

Option 2:

KSNODETYPE mappings are the preferred solution. However, if these mappings are not sufficient, it is possible to declare a given device as communication-class by adding the .inf driver.To use the .inf method, follow these steps:

1.Use the AddReg directive to reference a new add-registry section to add endpoint property keys. This step can be skipped if such a section already exists. The following example adds a new Endpoint.AddReg add-registry section under the USBAudio.MyDevice.Interface section/method/other element:

\[USBAudio.MyDevice.Interface\]

AddReg=Endpoint.AddReg

2.Next, create an add-registry section, if it does not already exist, to add endpoint property keys to the registry. The following example adds the appropriate property key for the first capture endpoint that is declared to be a communication device. The capture endpoint is declared in this INF method for the KSNODETYPE\_ANY node:

\[Endpoint.AddReg\]

HKR,"EP\\\\0",%PKEY\_AudioEndpoint\_Association%,,%KSNODETYPE\_ANY%

HKR,"EP\\\\0",%PKEY\_Endpoint\_EndpointRoleAffinity%,0x00010001,0x00000204

Note that there are three possible valid values for this key, based on whether the device is a render device, a capture device, or both:

0x00000104 – A render device of the associated KSNODETYPE descriptor would be tested as a communication device.

0x00000204 – A capture device of the associated KSNODETYPE descriptor would be tested as a communication device.

0x00000304 – A both render and capture device of the associated KSNODETYPE descriptor would be tested as a communication device.

3.In the strings section, add the following section for the value of the property keys that are used in step 2:

PKEY\_AudioEndpoint\_Association = "{1DA5D803-D492-4EDD-8C23-E0C0FFEE7F0E},2"

PKEY\_Endpoint\_EndpointRoleAffinity = "{b3f8fa53-0004-438e-9003-51a46e139bfc},13"

For more information about writing an INF file, see the Windows Driver Kit documentation.

Additional Information

|                             |                          |
|-----------------------------|--------------------------|
| Enforcement Date<br/> | Jun. 26, 2013<br/> |

 

## Device.Audio.USB


This audio device uses the USB Audio Driver.

|                                 |                                                                         |
|---------------------------------|-------------------------------------------------------------------------|
| Related Requirements<br/> | Device.Audio.USB.HIDControls<br/> Device.Audio.USB.USB<br/> |

 

### Device.Audio.USB.HIDControls

USB audio device uses USB HID audio controls to keep the operating system informed of user interactions with the device.

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.USB<br/>                                                                                                                                                                                                                                                    |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Requirement Device.Audio.USB.HIDCommunications has been merged with this one.

USB audio devices must use USB HID specification-compliant HID to control basic functions. If volume adjustment controls are implemented on the USB audio device, it must declare itself as a consumer control device (usage 0x01), as defined in Consumer Page (page 0x0C) in the USB Usage Tables for HID Power Devices, Release 1.1, and in Windows support for HID-based audio controls.

Communication devices that implement a USB HID interface must be compliant with the USB Device Class Definition for Human Interface Devices (HID), Version 1.1, and USB Usage Tables for HID Power Devices, Version 1.12.

Devices may not use Reserved usages from any Standard Usage Page.

See "HID Audio Controls and Windows" at <http://go.microsoft.com/fwlink/?LinkId=40491> and the Windows Driver Kit, "HID and Windows" for more design information.

Additional Information

|                                   |                                                                                                                                                                                                   |
|-----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | Without knowledge of volume/mute settings on the device the OS cannot make intelligent policy decisions that enable more predictable and better fidelity user experiences with Windows<br/> |
| Enforcement Date<br/>       | Sep. 17, 2008<br/>                                                                                                                                                                          |

 

### Device.Audio.USB.USB

USB Audio Device follows UAA USB Audio Design Guidelines

|                           |                                                                                                                                                                                                                                                                                |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Target Feature<br/> | Device.Audio.USB<br/>                                                                                                                                                                                                                                                    |
| Applies to<br/>     | Windows 7 Client x86, x64<br/> Windows 8 Client x86, x64, ARM (Windows RT)<br/> Windows 8.1 Client x86, x64, ARM (Windows RT 8.1)<br/> Windows Server 2012 R2 x64<br/> Windows Server 2008 Release 2 x64<br/> Windows Server 2012 x64<br/> |

 

Description

Requirements Device.Audio.Base.ProperUSBDescriptors and Device.Audio.USB.MicArray have been merged with this one.

Description: A USB audio-based audio device in a stand-alone external form factor or in an AVR or in other permutations follows the Microsoft UAA USB Audio Design Guidelines.

Special attention should be made to the following:

USB audio device must properly set descriptor to indicate the purpose of device according to the USB spec http://www.usb.org/developers/devclass\_docs/termt10.pdf

An externally connected USB based microphone array device must comply with the UAA-supported technology standard, must comply with the USB Device Class Definition for Audio Devices 1.0, and must be implemented according to the guidelines in "Microphone Array Support in Windows Vista." The device must report itself and its capabilities according to the design guidelines in the Microsoft USB Audio Microphone Array Design Guidelines.

Design Notes: See Microsoft UAA USB Audio Design Guidelines at <http://go.microsoft.com/fwlink/?LinkId=50734>.

Additional Information

|                                   |                                                                                                                                                                                 |
|-----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Justification<br/> | To maintain the choice within the UAA initiative it is necessary to have 1394 audio devices implemented according to the Microsoft UAA 1394 audio design guidelines.<br/> |
| Enforcement Date<br/>       | Jun. 26, 2013<br/>                                                                                                                                                        |

 

 

 





