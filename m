Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBC0C36000
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Mar 2025 17:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B22B10E1AA;
	Fri, 21 Mar 2025 17:46:34 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAA710E1AA;
 Fri, 21 Mar 2025 17:46:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Introduce_drm_sharpn?=
 =?utf-8?q?ess_property_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 21 Mar 2025 17:46:32 -0000
Message-ID: <174257919270.65716.3731818349293888739@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
In-Reply-To: <20250321160628.2663912-1-nemesa.garg@intel.com>
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Introduce drm sharpness property (rev11)
URL   : https://patchwork.freedesktop.org/series/138754/
State : warning

== Summary ==

Error: dim checkpatch failed
e56de964d70b drm/i915/display: Introduce sharpness strength property
4482b4cc602a drm/i915/display: Introduce HAS_CASF for sharpness support
070129dcedf1 drm/i915/display: Add sharpness strength and winsize
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 191 lines checked
1abad7a00d3c drm/i915/display: Add filter lut values
9f9ed4b45c91 drm/i915/display: Compute the scaler filter
4808e78736b1 drm/i915/display: Add and compute scaler parameter
c7456d806979 drm/i915/display: Configure the second scaler for
c0a28e980323 drm/i915/display: Compare the sharpness state
3edcf26f6890 drm/i915/display: Set a scaler mode
6c08f8594090 drm/i915/display: Write and read back the casf registers
70d20bc6cf89 drm/i915/display: Enable/disable casf
1866e1c6381e drm/i915/display: Expose sharpness strength property


