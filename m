Return-Path: <SRS0=BVws=LK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A356DC48BE6
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Jun 2021 20:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B9CC601FE
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Jun 2021 20:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B9CC601FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F000A897CD;
	Wed, 16 Jun 2021 20:32:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE31A8957D;
 Wed, 16 Jun 2021 20:32:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AA8C3A0078;
 Wed, 16 Jun 2021 20:32:17 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Wed, 16 Jun 2021 20:32:17 -0000
Message-ID: <162387553769.8274.12372586427605599851@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210616194415.36926-1-jose.souza@intel.com>
In-Reply-To: <20210616194415.36926-1-jose.souza@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZHJt?=
 =?utf-8?q?/dp=5Fmst=3A_Add_missing_drm_parameters_to_recently_added_call_?=
 =?utf-8?q?to_drm=5Fdbg=5Fkms=28=29?=
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0445819865=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============0445819865==
Content-Type: multipart/alternative;
 boundary="===============2390720132949704370=="

--===============2390720132949704370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/dp_mst: Add missing drm parameters to recently added call to drm_dbg_kms()
URL   : https://patchwork.freedesktop.org/series/91592/
State : failure

== Summary ==

Applying: drm/dp_mst: Add missing drm parameters to recently added call to drm_dbg_kms()
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/drm_dp_mst_topology.c
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.



--===============2390720132949704370==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/dp_mst: Add missing drm parameters to recently added call to drm_dbg_kms()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91592/">https://patchwork.freedesktop.org/series/91592/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <p>Applying: drm/dp_mst: Add missing drm parameters to recently added call to drm_dbg_kms()<br />
Using index info to reconstruct a base tree...<br />
M   drivers/gpu/drm/drm_dp_mst_topology.c<br />
Falling back to patching base and 3-way merge...<br />
No changes -- Patch already applied.</p>

</body>
</html>

--===============2390720132949704370==--

--===============0445819865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0445819865==--
