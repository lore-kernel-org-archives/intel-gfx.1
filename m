Return-Path: <SRS0=MDkJ=KB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54601C433B4
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 17:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D93746102A
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 17:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D93746102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4184E6ECD7;
	Thu,  6 May 2021 17:35:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 91F236ECD7;
 Thu,  6 May 2021 17:35:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7DB9EA7DFC;
 Thu,  6 May 2021 17:35:01 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Werner Sembach" <wse@tuxedocomputers.com>
Date: Thu, 06 May 2021 17:35:01 -0000
Message-ID: <162032250151.15693.11996296430183084888@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210506172325.1995964-1-wse@tuxedocomputers.com>
In-Reply-To: <20210506172325.1995964-1-wse@tuxedocomputers.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/display=3A_Try_YCbCr420_color_when_RGB_fails?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/display: Try YCbCr420 color when RGB fails
URL   : https://patchwork.freedesktop.org/series/89842/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
00bf5b4bbe7e drm/i915/display: New function to avoid duplicate code in upcomming commits
-:7: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7: 
Moves some checks that later will be performed 2 times to an own fuction. This

-:7: WARNING:TYPO_SPELLING: 'fuction' may be misspelled - perhaps 'function'?
#7: 
Moves some checks that later will be performed 2 times to an own fuction. This
                                                                 ^^^^^^^

total: 0 errors, 2 warnings, 0 checks, 53 lines checked
6cff290a93e1 drm/i915/display: Restructure output format computation for better expandability
-:7: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7: 
Couples the decission between RGB and YCbCr420 mode and the check if the port

-:58: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#58: FILE: drivers/gpu/drm/i915/display/intel_hdmi.c:2110:
+static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
+				     struct intel_crtc_state *crtc_state,

-:68: CHECK:BRACES: braces {} should be used on all arms of this statement
#68: FILE: drivers/gpu/drm/i915/display/intel_hdmi.c:2120:
+	if (connector->ycbcr_420_allowed && ycbcr_420_only)
[...]
+	else {
[...]

-:70: CHECK:BRACES: Unbalanced braces around else statement
#70: FILE: drivers/gpu/drm/i915/display/intel_hdmi.c:2122:
+	else {

total: 0 errors, 1 warnings, 3 checks, 92 lines checked
fa1ae5bd837f drm/i915/display: Use YCbCr420 as fallback when RGB fails
-:48: WARNING:LONG_LINE: line length of 125 exceeds 100 columns
#48: FILE: drivers/gpu/drm/i915/display/intel_hdmi.c:1924:
+		if (ycbcr_420_only || !connector->ycbcr_420_allowed || !drm_mode_is_420_also(&connector->display_info, mode))

-:65: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#65: FILE: drivers/gpu/drm/i915/display/intel_hdmi.c:2140:
+		if (crtc_state->output_format != INTEL_OUTPUT_FORMAT_YCBCR420 &&
+				connector->ycbcr_420_allowed &&

total: 0 errors, 1 warnings, 1 checks, 44 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
