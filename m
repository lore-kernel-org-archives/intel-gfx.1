Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8764C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Mar 2022 13:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B17F10F099;
	Tue, 29 Mar 2022 13:10:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5849010F099;
 Tue, 29 Mar 2022 13:10:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 53B33A00FD;
 Tue, 29 Mar 2022 13:10:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5616080750399499072=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Date: Tue, 29 Mar 2022 13:10:35 -0000
Message-ID: <164855943533.5797.13331732049736732689@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220329070001.134180-1-christian.koenig@amd.com>
In-Reply-To: <20220329070001.134180-1-christian.koenig@amd.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2Vy?=
 =?utf-8?q?ies_starting_with_=5B1/2=5D_dma-buf/sync-file=3A_fix_logic_erro?=
 =?utf-8?q?r_in_new_fence_merge_code?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============5616080750399499072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] dma-buf/sync-file: fix logic error in new fence merge code
URL   : https://patchwork.freedesktop.org/series/101923/
State : failure

== Summary ==

Applying: dma-buf/sync-file: fix logic error in new fence merge code
Using index info to reconstruct a base tree...
M	drivers/dma-buf/sync_file.c
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: dma-buf: handle empty dma_fence_arrays gracefully
Using index info to reconstruct a base tree...
M	drivers/dma-buf/dma-fence-array.c
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.



--===============5616080750399499072==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] dma-buf/sync-file: fix logic error in new fence merge code</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101923/">https://patchwork.freedesktop.org/series/101923/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <p>Applying: dma-buf/sync-file: fix logic error in new fence merge code<br />
Using index info to reconstruct a base tree...<br />
M   drivers/dma-buf/sync_file.c<br />
Falling back to patching base and 3-way merge...<br />
No changes -- Patch already applied.<br />
Applying: dma-buf: handle empty dma_fence_arrays gracefully<br />
Using index info to reconstruct a base tree...<br />
M   drivers/dma-buf/dma-fence-array.c<br />
Falling back to patching base and 3-way merge...<br />
No changes -- Patch already applied.</p>

</body>
</html>

--===============5616080750399499072==--
