Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28538606A323
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 21:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC57B10E469;
	Mon, 16 Nov 2026 21:21:21 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638A410E469;
 Mon, 16 Nov 2026 21:21:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6722499136694413281=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm/i915/backlight=3A_Kee?=
 =?utf-8?q?p_ACPI_brightness_requests_while_the_display_is_off?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexis Calin via B4 Relay" <devnull+alexiscalin.protonmail.com@kernel.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 16 Nov 2026 21:21:20 -0000
Message-ID: <179486408039.34296.15636660607419765572@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261114-i915-acpi-backlight-display-off-v1-1-9306f19d605a@protonmail.com>
In-Reply-To: <20261114-i915-acpi-backlight-display-off-v1-1-9306f19d605a@protonmail.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6722499136694413281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/backlight: Keep ACPI brightness requests while the display is off
URL   : https://patchwork.freedesktop.org/series/178708/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19533 -> Patchwork_178708v1
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_178708v1 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_178708v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178708v1/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_178708v1:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - fi-bsw-nick:        [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19533/fi-bsw-nick/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178708v1/fi-bsw-nick/igt@i915_selftest@live.html

  


Build changes
-------------

  * Linux: CI_DRM_19533 -> Patchwork_178708v1

  CI-20190529: 20190529
  CI_DRM_19533: d5a6e2921e68b0cc42812376ca6c8095b6c941a2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9193: 9193
  Patchwork_178708v1: d5a6e2921e68b0cc42812376ca6c8095b6c941a2 @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178708v1/index.html

--===============6722499136694413281==
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
<tr><td><b>Series:</b></td><td>drm/i915/backlight: Keep ACPI brightness requests while the display is off</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178708/">https://patchwork.freedesktop.org/series/178708/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178708v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178708v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19533 -&gt; Patchwork_178708v1</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_178708v1 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_178708v1, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178708v1/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_178708v1:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19533/fi-bsw-nick/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178708v1/fi-bsw-nick/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19533 -&gt; Patchwork_178708v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19533: d5a6e2921e68b0cc42812376ca6c8095b6c941a2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9193: 9193<br />
  Patchwork_178708v1: d5a6e2921e68b0cc42812376ca6c8095b6c941a2 @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============6722499136694413281==--
