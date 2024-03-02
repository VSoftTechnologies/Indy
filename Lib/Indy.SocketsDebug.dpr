library Indy.SocketsDebug;

{%DelphiDotNetAssemblyCompiler '$(SystemRoot)\microsoft.net\framework\v1.1.4322\System.dll'}
{%DelphiDotNetAssemblyCompiler '$(CommonProgramFiles)\borland shared\bds\shared assemblies\3.0\Borland.Delphi.dll'}
{%DelphiDotNetAssemblyCompiler '$(CommonProgramFiles)\borland shared\bds\shared assemblies\3.0\Borland.VclRtl.dll'}


uses
  IdASN1Util in 'Protocols\IdASN1Util.pas',
  IdAllAuthentications in 'Protocols\IdAllAuthentications.pas',
  IdAllFTPListParsers in 'Protocols\IdAllFTPListParsers.pas',
  IdAllHeaderCoders in 'Protocols\IdAllHeaderCoders.pas',
  IdAntiFreezeBase in 'System\IdAntiFreezeBase.pas',
  IdAssignedNumbers in 'Core\IdAssignedNumbers.pas',
  IdAttachment in 'Protocols\IdAttachment.pas',
  IdAttachmentFile in 'Protocols\IdAttachmentFile.pas',
  IdAttachmentMemory in 'Protocols\IdAttachmentMemory.pas',
  IdAuthentication in 'Protocols\IdAuthentication.pas',
  IdAuthenticationDigest in 'Protocols\IdAuthenticationDigest.pas',
  IdAuthenticationManager in 'Protocols\IdAuthenticationManager.pas',
  IdBaseComponent in 'System\IdBaseComponent.pas',
  IdBlockCipherIntercept in 'Protocols\IdBlockCipherIntercept.pas',
  IdBuffer in 'Core\IdBuffer.pas',
  IdCarrierStream in 'Security\IdCarrierStream.pas',
  IdChargenServer in 'Protocols\IdChargenServer.pas',
  IdChargenUDPServer in 'Protocols\IdChargenUDPServer.pas',
  IdCharsets in 'Protocols\IdCharsets.pas',
  IdCmdTCPClient in 'Core\IdCmdTCPClient.pas',
  IdCmdTCPServer in 'Core\IdCmdTCPServer.pas',
  IdCoder in 'Protocols\IdCoder.pas',
  IdCoder00E in 'Protocols\IdCoder00E.pas',
  IdCoder3to4 in 'Protocols\IdCoder3to4.pas',
  IdCoderBinHex4 in 'Protocols\IdCoderBinHex4.pas',
  IdCoderHeader in 'Protocols\IdCoderHeader.pas',
  IdCoderMIME in 'Protocols\IdCoderMIME.pas',
  IdCoderQuotedPrintable in 'Protocols\IdCoderQuotedPrintable.pas',
  IdCoderUUE in 'Protocols\IdCoderUUE.pas',
  IdCoderXXE in 'Protocols\IdCoderXXE.pas',
  IdCommandHandlers in 'Core\IdCommandHandlers.pas',
  IdComponent in 'System\IdComponent.pas',
  IdConnectThroughHttpProxy in 'Protocols\IdConnectThroughHttpProxy.pas',
  IdContainers in 'Protocols\IdContainers.pas',
  IdContext in 'Core\IdContext.pas',
  IdCookie in 'Protocols\IdCookie.pas',
  IdCookieManager in 'Protocols\IdCookieManager.pas',
  IdCustomHTTPServer in 'Protocols\IdCustomHTTPServer.pas',
  IdCustomTCPServer in 'Core\IdCustomTCPServer.pas',
  IdCustomTransparentProxy in 'Core\IdCustomTransparentProxy.pas',
  IdDICT in 'Protocols\IdDICT.pas',
  IdDICTCommon in 'Protocols\IdDICTCommon.pas',
  IdDICTServer in 'Protocols\IdDICTServer.pas',
  IdDNSCommon in 'Protocols\IdDNSCommon.pas',
  IdDNSResolver in 'Protocols\IdDNSResolver.pas',
  IdDNSServer in 'Protocols\IdDNSServer.pas',
  IdDateTimeStamp in 'Protocols\IdDateTimeStamp.pas',
  IdDayTime in 'Protocols\IdDayTime.pas',
  IdDayTimeServer in 'Protocols\IdDayTimeServer.pas',
  IdDayTimeUDP in 'Protocols\IdDayTimeUDP.pas',
  IdDayTimeUDPServer in 'Protocols\IdDayTimeUDPServer.pas',
  IdDiscardServer in 'Protocols\IdDiscardServer.pas',
  IdDiscardUDPServer in 'Protocols\IdDiscardUDPServer.pas',
  IdEMailAddress in 'Protocols\IdEMailAddress.pas',
  IdEcho in 'Protocols\IdEcho.pas',
  IdEchoServer in 'Protocols\IdEchoServer.pas',
  IdEchoUDP in 'Protocols\IdEchoUDP.pas',
  IdEchoUDPServer in 'Protocols\IdEchoUDPServer.pas',
  IdException in 'System\IdException.pas',
  IdExceptionCore in 'Core\IdExceptionCore.pas',
  IdExplicitTLSClientServerBase in 'Protocols\IdExplicitTLSClientServerBase.pas',
  IdFIPS in 'Protocols\IdFIPS.pas',
  IdFSP in 'Protocols\IdFSP.pas',
  IdFTP in 'Protocols\IdFTP.pas',
  IdFTPBaseFileSystem in 'Protocols\IdFTPBaseFileSystem.pas',
  IdFTPCommon in 'Protocols\IdFTPCommon.pas',
  IdFTPList in 'Protocols\IdFTPList.pas',
  IdFTPListOutput in 'Protocols\IdFTPListOutput.pas',
  IdFTPListParseAS400 in 'Protocols\IdFTPListParseAS400.pas',
  IdFTPListParseBase in 'Protocols\IdFTPListParseBase.pas',
  IdFTPListParseBullGCOS7 in 'Protocols\IdFTPListParseBullGCOS7.pas',
  IdFTPListParseBullGCOS8 in 'Protocols\IdFTPListParseBullGCOS8.pas',
  IdFTPListParseChameleonNewt in 'Protocols\IdFTPListParseChameleonNewt.pas',
  IdFTPListParseCiscoIOS in 'Protocols\IdFTPListParseCiscoIOS.pas',
  IdFTPListParseDistinctTCPIP in 'Protocols\IdFTPListParseDistinctTCPIP.pas',
  IdFTPListParseEPLF in 'Protocols\IdFTPListParseEPLF.pas',
  IdFTPListParseHellSoft in 'Protocols\IdFTPListParseHellSoft.pas',
  IdFTPListParseIEFTPGateway in 'Protocols\IdFTPListParseIEFTPGateway.pas',
  IdFTPListParseKA9Q in 'Protocols\IdFTPListParseKA9Q.pas',
  IdFTPListParseMPEiX in 'Protocols\IdFTPListParseMPEiX.pas',
  IdFTPListParseMVS in 'Protocols\IdFTPListParseMVS.pas',
  IdFTPListParseMicrowareOS9 in 'Protocols\IdFTPListParseMicrowareOS9.pas',
  IdFTPListParseMusic in 'Protocols\IdFTPListParseMusic.pas',
  IdFTPListParseNCSAForDOS in 'Protocols\IdFTPListParseNCSAForDOS.pas',
  IdFTPListParseNCSAForMACOS in 'Protocols\IdFTPListParseNCSAForMACOS.pas',
  IdFTPListParseNovellNetware in 'Protocols\IdFTPListParseNovellNetware.pas',
  IdFTPListParseNovellNetwarePSU in 'Protocols\IdFTPListParseNovellNetwarePSU.pas',
  IdFTPListParseOS2 in 'Protocols\IdFTPListParseOS2.pas',
  IdFTPListParsePCNFSD in 'Protocols\IdFTPListParsePCNFSD.pas',
  IdFTPListParsePCTCP in 'Protocols\IdFTPListParsePCTCP.pas',
  IdFTPListParseStercomOS390Exp in 'Protocols\IdFTPListParseStercomOS390Exp.pas',
  IdFTPListParseStercomUnixEnt in 'Protocols\IdFTPListParseStercomUnixEnt.pas',
  IdFTPListParseStratusVOS in 'Protocols\IdFTPListParseStratusVOS.pas',
  IdFTPListParseSuperTCP in 'Protocols\IdFTPListParseSuperTCP.pas',
  IdFTPListParseTOPS20 in 'Protocols\IdFTPListParseTOPS20.pas',
  IdFTPListParseTSXPlus in 'Protocols\IdFTPListParseTSXPlus.pas',
  IdFTPListParseTandemGuardian in 'Protocols\IdFTPListParseTandemGuardian.pas',
  IdFTPListParseUnisysClearPath in 'Protocols\IdFTPListParseUnisysClearPath.pas',
  IdFTPListParseUnix in 'Protocols\IdFTPListParseUnix.pas',
  IdFTPListParseVM in 'Protocols\IdFTPListParseVM.pas',
  IdFTPListParseVMS in 'Protocols\IdFTPListParseVMS.pas',
  IdFTPListParseVSE in 'Protocols\IdFTPListParseVSE.pas',
  IdFTPListParseVxWorks in 'Protocols\IdFTPListParseVxWorks.pas',
  IdFTPListParseWfFTP in 'Protocols\IdFTPListParseWfFTP.pas',
  IdFTPListParseWinQVTNET in 'Protocols\IdFTPListParseWinQVTNET.pas',
  IdFTPListParseWindowsNT in 'Protocols\IdFTPListParseWindowsNT.pas',
  IdFTPListParseXecomMicroRTOS in 'Protocols\IdFTPListParseXecomMicroRTOS.pas',
  IdFTPListTypes in 'Protocols\IdFTPListTypes.pas',
  IdFTPServer in 'Protocols\IdFTPServer.pas',
  IdFTPServerContextBase in 'Protocols\IdFTPServerContextBase.pas',
  IdFinger in 'Protocols\IdFinger.pas',
  IdFingerServer in 'Protocols\IdFingerServer.pas',
  IdGlobal in 'System\IdGlobal.pas',
  IdGlobalCore in 'Core\IdGlobalCore.pas',
  IdGlobalProtocols in 'Protocols\IdGlobalProtocols.pas',
  IdGopher in 'Protocols\IdGopher.pas',
  IdGopherConsts in 'Protocols\IdGopherConsts.pas',
  IdGopherServer in 'Protocols\IdGopherServer.pas',
  IdHL7 in 'Protocols\IdHL7.pas',
  IdHMAC in 'Protocols\IdHMAC.pas',
  IdHMACMD5 in 'Protocols\IdHMACMD5.pas',
  IdHMACSHA1 in 'Protocols\IdHMACSHA1.pas',
  IdHTTP in 'Protocols\IdHTTP.pas',
  IdHTTPHeaderInfo in 'Protocols\IdHTTPHeaderInfo.pas',
  IdHTTPProxyServer in 'Protocols\IdHTTPProxyServer.pas',
  IdHTTPServer in 'Protocols\IdHTTPServer.pas',
  IdHash in 'Protocols\IdHash.pas',
  IdHashCRC in 'Protocols\IdHashCRC.pas',
  IdHashElf in 'Protocols\IdHashElf.pas',
  IdHashMessageDigest in 'Protocols\IdHashMessageDigest.pas',
  IdHashSHA in 'Protocols\IdHashSHA.pas',
  IdHeaderCoderBase in 'Protocols\IdHeaderCoderBase.pas',
  IdHeaderCoderIndy in 'Protocols\IdHeaderCoderIndy.pas',
  IdHeaderCoderPlain in 'Protocols\IdHeaderCoderPlain.pas',
  IdHeaderList in 'Protocols\IdHeaderList.pas',
  IdIMAP4 in 'Protocols\IdIMAP4.pas',
  IdIMAP4Server in 'Protocols\IdIMAP4Server.pas',
  IdIOHandler in 'Core\IdIOHandler.pas',
  IdIOHandlerSocket in 'Core\IdIOHandlerSocket.pas',
  IdIOHandlerStack in 'Core\IdIOHandlerStack.pas',
  IdIOHandlerStream in 'Core\IdIOHandlerStream.pas',
  IdIOHandlerTls in 'Security\IdIOHandlerTls.pas',
  IdIPAddrMon in 'Protocols\IdIPAddrMon.pas',
  IdIPAddress in 'Core\IdIPAddress.pas',
  IdIPMCastBase in 'Core\IdIPMCastBase.pas',
  IdIPMCastClient in 'Core\IdIPMCastClient.pas',
  IdIPMCastServer in 'Core\IdIPMCastServer.pas',
  IdIPWatch in 'Protocols\IdIPWatch.pas',
  IdIRC in 'Protocols\IdIRC.pas',
  IdIcmpClient in 'Core\IdIcmpClient.pas',
  IdIdent in 'Protocols\IdIdent.pas',
  IdIdentServer in 'Protocols\IdIdentServer.pas',
  IdIntercept in 'Core\IdIntercept.pas',
  IdInterceptSimLog in 'Core\IdInterceptSimLog.pas',
  IdInterceptThrottler in 'Core\IdInterceptThrottler.pas',
  IdIrcServer in 'Protocols\IdIrcServer.pas',
  IdLPR in 'Protocols\IdLPR.pas',
  IdLogBase in 'Core\IdLogBase.pas',
  IdLogDebug in 'Core\IdLogDebug.pas',
  IdLogEvent in 'Core\IdLogEvent.pas',
  IdLogFile in 'Core\IdLogFile.pas',
  IdLogStream in 'Core\IdLogStream.pas',
  IdMailBox in 'Protocols\IdMailBox.pas',
  IdMappedFTP in 'Protocols\IdMappedFTP.pas',
  IdMappedPOP3 in 'Protocols\IdMappedPOP3.pas',
  IdMappedPortTCP in 'Protocols\IdMappedPortTCP.pas',
  IdMappedPortUDP in 'Protocols\IdMappedPortUDP.pas',
  IdMappedTelnet in 'Protocols\IdMappedTelnet.pas',
  IdMessage in 'Protocols\IdMessage.pas',
  IdMessageBuilder in 'Protocols\IdMessageBuilder.pas',
  IdMessageClient in 'Protocols\IdMessageClient.pas',
  IdMessageCoder in 'Protocols\IdMessageCoder.pas',
  IdMessageCoderBinHex4 in 'Protocols\IdMessageCoderBinHex4.pas',
  IdMessageCoderMIME in 'Protocols\IdMessageCoderMIME.pas',
  IdMessageCoderQuotedPrintable in 'Protocols\IdMessageCoderQuotedPrintable.pas',
  IdMessageCoderUUE in 'Protocols\IdMessageCoderUUE.pas',
  IdMessageCoderXXE in 'Protocols\IdMessageCoderXXE.pas',
  IdMessageCoderYenc in 'Protocols\IdMessageCoderYenc.pas',
  IdMessageCollection in 'Protocols\IdMessageCollection.pas',
  IdMessageHelper in 'Protocols\IdMessageHelper.pas',
  IdMessageParts in 'Protocols\IdMessageParts.pas',
  IdMultipartFormData in 'Protocols\IdMultipartFormData.pas',
  IdNNTP in 'Protocols\IdNNTP.pas',
  IdNNTPServer in 'Protocols\IdNNTPServer.pas',
  IdNetworkCalculator in 'Protocols\IdNetworkCalculator.pas',
  IdOSFileName in 'Protocols\IdOSFileName.pas',
  IdOTPCalculator in 'Protocols\IdOTPCalculator.pas',
  IdPOP3 in 'Protocols\IdPOP3.pas',
  IdPOP3Server in 'Protocols\IdPOP3Server.pas',
  IdQOTDUDP in 'Protocols\IdQOTDUDP.pas',
  IdQOTDUDPServer in 'Protocols\IdQOTDUDPServer.pas',
  IdQotd in 'Protocols\IdQotd.pas',
  IdQotdServer in 'Protocols\IdQotdServer.pas',
  IdRSH in 'Protocols\IdRSH.pas',
  IdRSHServer in 'Protocols\IdRSHServer.pas',
  IdRawBase in 'Core\IdRawBase.pas',
  IdRawClient in 'Core\IdRawClient.pas',
  IdRawFunctions in 'Core\IdRawFunctions.pas',
  IdRawHeaders in 'Core\IdRawHeaders.pas',
  IdRemoteCMDClient in 'Protocols\IdRemoteCMDClient.pas',
  IdRemoteCMDServer in 'Protocols\IdRemoteCMDServer.pas',
  IdReply in 'Core\IdReply.pas',
  IdReplyFTP in 'Protocols\IdReplyFTP.pas',
  IdReplyIMAP4 in 'Protocols\IdReplyIMAP4.pas',
  IdReplyPOP3 in 'Protocols\IdReplyPOP3.pas',
  IdReplyRFC in 'Core\IdReplyRFC.pas',
  IdReplySMTP in 'Protocols\IdReplySMTP.pas',
  IdResourceStrings in 'System\IdResourceStrings.pas',
  IdResourceStringsCore in 'Core\IdResourceStringsCore.pas',
  IdResourceStringsProtocols in 'Protocols\IdResourceStringsProtocols.pas',
  IdRexec in 'Protocols\IdRexec.pas',
  IdRexecServer in 'Protocols\IdRexecServer.pas',
  IdSASL in 'Protocols\IdSASL.pas',
  IdSASLAnonymous in 'Protocols\IdSASLAnonymous.pas',
  IdSASLCollection in 'Protocols\IdSASLCollection.pas',
  IdSASLDigest in 'Protocols\IdSASLDigest.pas',
  IdSASLExternal in 'Protocols\IdSASLExternal.pas',
  IdSASLLogin in 'Protocols\IdSASLLogin.pas',
  IdSASLOTP in 'Protocols\IdSASLOTP.pas',
  IdSASLPlain in 'Protocols\IdSASLPlain.pas',
  IdSASLSKey in 'Protocols\IdSASLSKey.pas',
  IdSASLUserPass in 'Protocols\IdSASLUserPass.pas',
  IdSASL_CRAMBase in 'Protocols\IdSASL_CRAMBase.pas',
  IdSASL_CRAM_MD5 in 'Protocols\IdSASL_CRAM_MD5.pas',
  IdSASL_CRAM_SHA1 in 'Protocols\IdSASL_CRAM_SHA1.pas',
  IdSMTP in 'Protocols\IdSMTP.pas',
  IdSMTPBase in 'Protocols\IdSMTPBase.pas',
  IdSMTPRelay in 'Protocols\IdSMTPRelay.pas',
  IdSMTPServer in 'Protocols\IdSMTPServer.pas',
  IdSNPP in 'Protocols\IdSNPP.pas',
  IdSNTP in 'Protocols\IdSNTP.pas',
  IdSSL in 'Protocols\IdSSL.pas',
  IdSSLDotNET in 'Protocols\IdSSLDotNET.pas',
  IdScheduler in 'Core\IdScheduler.pas',
  IdSchedulerOfThread in 'Core\IdSchedulerOfThread.pas',
  IdSchedulerOfThreadDefault in 'Core\IdSchedulerOfThreadDefault.pas',
  IdSchedulerOfThreadPool in 'Core\IdSchedulerOfThreadPool.pas',
  IdServerIOHandler in 'Core\IdServerIOHandler.pas',
  IdServerIOHandlerSocket in 'Core\IdServerIOHandlerSocket.pas',
  IdServerIOHandlerStack in 'Core\IdServerIOHandlerStack.pas',
  IdServerIOHandlerTls in 'Security\IdServerIOHandlerTls.pas',
  IdServerInterceptLogBase in 'Protocols\IdServerInterceptLogBase.pas',
  IdServerInterceptLogEvent in 'Protocols\IdServerInterceptLogEvent.pas',
  IdServerInterceptLogFile in 'Protocols\IdServerInterceptLogFile.pas',
  IdSimpleServer in 'Core\IdSimpleServer.pas',
  IdSocketHandle in 'Core\IdSocketHandle.pas',
  IdSocketStream in 'Security\IdSocketStream.pas',
  IdSocks in 'Core\IdSocks.pas',
  IdSocksServer in 'Protocols\IdSocksServer.pas',
  IdStack in 'System\IdStack.pas',
  IdStackConsts in 'System\IdStackConsts.pas',
  IdStackDotNet in 'System\IdStackDotNet.pas',
  IdStream in 'System\IdStream.pas',
  IdStreamNET in 'System\IdStreamNET.pas',
  IdStrings in 'Protocols\IdStrings.pas',
  IdStruct in 'System\IdStruct.pas',
  IdSync in 'Core\IdSync.pas',
  IdSysLog in 'Protocols\IdSysLog.pas',
  IdSysLogMessage in 'Protocols\IdSysLogMessage.pas',
  IdSysLogServer in 'Protocols\IdSysLogServer.pas',
  IdSystat in 'Protocols\IdSystat.pas',
  IdSystatServer in 'Protocols\IdSystatServer.pas',
  IdSystatUDP in 'Protocols\IdSystatUDP.pas',
  IdSystatUDPServer in 'Protocols\IdSystatUDPServer.pas',
  IdTCPClient in 'Core\IdTCPClient.pas',
  IdTCPConnection in 'Core\IdTCPConnection.pas',
  IdTCPServer in 'Core\IdTCPServer.pas',
  IdTCPStream in 'Core\IdTCPStream.pas',
  IdTask in 'Core\IdTask.pas',
  IdTelnet in 'Protocols\IdTelnet.pas',
  IdTelnetServer in 'Protocols\IdTelnetServer.pas',
  IdText in 'Protocols\IdText.pas',
  IdThread in 'Core\IdThread.pas',
  IdThreadComponent in 'Core\IdThreadComponent.pas',
  IdThreadSafe in 'Core\IdThreadSafe.pas',
  IdTime in 'Protocols\IdTime.pas',
  IdTimeServer in 'Protocols\IdTimeServer.pas',
  IdTimeUDP in 'Protocols\IdTimeUDP.pas',
  IdTimeUDPServer in 'Protocols\IdTimeUDPServer.pas',
  IdTlsClientOptions in 'Security\IdTlsClientOptions.pas',
  IdTlsServerOptions in 'Security\IdTlsServerOptions.pas',
  IdTraceRoute in 'Core\IdTraceRoute.pas',
  IdTrivialFTP in 'Protocols\IdTrivialFTP.pas',
  IdTrivialFTPBase in 'Protocols\IdTrivialFTPBase.pas',
  IdTrivialFTPServer in 'Protocols\IdTrivialFTPServer.pas',
  IdUDPBase in 'Core\IdUDPBase.pas',
  IdUDPClient in 'Core\IdUDPClient.pas',
  IdUDPServer in 'Core\IdUDPServer.pas',
  IdURI in 'Protocols\IdURI.pas',
  IdUnixTime in 'Protocols\IdUnixTime.pas',
  IdUnixTimeServer in 'Protocols\IdUnixTimeServer.pas',
  IdUnixTimeUDP in 'Protocols\IdUnixTimeUDP.pas',
  IdUnixTimeUDPServer in 'Protocols\IdUnixTimeUDPServer.pas',
  IdUriUtils in 'Protocols\IdUriUtils.pas',
  IdUserAccounts in 'Protocols\IdUserAccounts.pas',
  IdUserPassProvider in 'Protocols\IdUserPassProvider.pas',
  IdVCard in 'Protocols\IdVCard.pas',
  IdWebDAV in 'Protocols\IdWebDAV.pas',
  IdWhoIsServer in 'Protocols\IdWhoIsServer.pas',
  IdWhois in 'Protocols\IdWhois.pas',
  IdYarn in 'Core\IdYarn.pas',
  IdZLibCompressorBase in 'Protocols\IdZLibCompressorBase.pas',
  IdAssemblyInfo in 'System\IdAssemblyInfo.pas';


//
// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Revision and Build Numbers
// by using the '*' as shown below:


//
// In order to sign your assembly you must specify a key to use. Refer to the
// Microsoft .NET Framework documentation for more information on assembly signing.
//
// Use the attributes below to control which key is used for signing.
//
// Notes:
//   (*) If no key is specified, the assembly is not signed.
//   (*) KeyName refers to a key that has been installed in the Crypto Service
//       Provider (CSP) on your machine. KeyFile refers to a file which contains
//       a key.
//   (*) If the KeyFile and the KeyName values are both specified, the
//       following processing occurs:
//       (1) If the KeyName can be found in the CSP, that key is used.
//       (2) If the KeyName does not exist and the KeyFile does exist, the key
//           in the KeyFile is installed into the CSP and used.
//   (*) In order to create a KeyFile, you can use the sn.exe (Strong Name) utility.
//       When specifying the KeyFile, the location of the KeyFile should be
//       relative to the project output directory. For example, if your KeyFile is
//       located in the project directory, you would specify the AssemblyKeyFile
//       attribute as [assembly: AssemblyKeyFile('mykey.snk')], provided your output
//       directory is the project directory (the default).
//   (*) Delay Signing is an advanced option - see the Microsoft .NET Framework
//       documentation for more information on this.
//

//
// Use the attributes below to control the COM visibility of your assembly. By
// default the entire assembly is visible to COM. Setting ComVisible to false
// is the recommended default for your assembly. To then expose a class and interface
// to COM set ComVisible to true on each one. It is also recommended to add a
// Guid attribute.
//

//[assembly: Guid(')]
//[assembly: TypeLibVersion(1, 0)]

begin

end.
