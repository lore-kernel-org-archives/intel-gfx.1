Return-Path: <SRS0=8ese=K3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E74DC47080
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Jun 2021 10:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 296396136E
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Jun 2021 10:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 296396136E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB836E9D2;
	Tue,  1 Jun 2021 10:06:01 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27A76E10C;
 Tue,  1 Jun 2021 10:05:58 +0000 (UTC)
IronPort-SDR: c/vbje3Fx/CEwGvFw60OHDJ5UYCVa08ELqEiQBNM+dZ4NyX/ZV2sR+vI+JpMrFs9sl4biWUD73
 qlgx4rykXsLw==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="183197715"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="183197715"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:44 -0700
IronPort-SDR: l42+PHjSaC1K4ps+/dH7HHDocTMwtzxbw07I2bUR2qCVhgeM6rugvH6aC9YzWEuBXD597Ynjqm
 k6W7dczNhIpQ==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="399245118"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:05:35 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Tue,  1 Jun 2021 16:11:26 +0530
Message-Id: <20210601104135.29020-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/9] Enhance pipe color support for multi
 segmented luts
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Modern hardwares have multi segmented lut approach to prioritize
the darker regions of the spectrum. This series introduces a new
UAPI to define the lut ranges supported by the respective hardware.

This also enables Pipe Color Management Support for Intel's XE_LPD hw.
Enable Support for Pipe Degamma with the increased lut samples
supported by hardware. This also adds support for newly introduced
Logarithmic Gamma for XE_LPD. Also added the gamma readout support.

The Logarithmic gamma implementation on XE_LPD is non linear and adds 25
segments with non linear lut samples in each segment. The expectation
is userspace will create the luts as per this distribution and pass
the final samples to driver to be programmed in hardware.

+-----+------------------------------+
| x   |  2 pow x segment|No of Entries
|     |  0              | 1          |
| 0   |  1              | 1          |
| 1   |  2              | 2          |
| 2   |  4              | 2          |
| 3   |  8              | 2          |
| 4   |  16             | 2          |
| 5   |  32             | 4          |
| 6   |  64             | 4          |
| 7   |  128            | 4          |
| 8   |  256            | 8          |
| 9   |  512            | 8          |
| 10  |  1024           | 8          |
| 11  |  2048           | 16         |
| 12  |  4096           | 16         |
| 13  |  8192           | 16         |
| 14  |  16384          | 32         |
| 15  |  32768          | 32         |
| 16  |  65536          | 64         |
| 17  |  131072         | 64         |
| 18  |  262144         | 64         |
| 19  |  524288         | 32         |
| 20  |  1048576        | 32         |
| 21  |  2097152        | 32         |
| 22  |  4194304        | 32         |
| 23  |  8388608        | 32         |
| 24  |  16777216       | 1          |
|     | Total Entries   | 511        |
 -----+-----------------+------------+

Credits: Special mention and credits to Ville Syrjala for coming up
with a design for this feature and inputs. This series is based on
his original design.

Note: Userspace support for this new UAPI will be done on Chrome and
plan is to get this supported on mutter as well. We will notify the
list once we have that ready for review.

Uma Shankar (9):
  drm: Add gamma mode property
  drm/i915/xelpd: Define color lut range structure
  drm/i915/xelpd: Add support for Logarithmic gamma mode
  drm/i915/xelpd: Attach gamma mode property
  drm: Add Client Cap for advance gamma mode
  drm/i915/xelpd: logarithmic gamma enabled only with advance gamma mode
  drm/i915/xelpd: Enable Pipe Degamma
  drm/i915/xelpd: Add Pipe Color Lut caps to platform config
  drm/i915/xelpd: Enable XE_LPD Gamma Lut readout

 drivers/gpu/drm/drm_atomic_uapi.c          |   8 +
 drivers/gpu/drm/drm_color_mgmt.c           |  75 ++++
 drivers/gpu/drm/drm_ioctl.c                |   5 +
 drivers/gpu/drm/i915/display/intel_color.c | 454 ++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_pci.c            |   3 +-
 drivers/gpu/drm/i915/i915_reg.h            |   7 +
 include/drm/drm_atomic.h                   |   1 +
 include/drm/drm_color_mgmt.h               |   8 +
 include/drm/drm_crtc.h                     |  25 ++
 include/drm/drm_file.h                     |   8 +
 include/uapi/drm/drm.h                     |   8 +
 include/uapi/drm/drm_mode.h                |  43 ++
 12 files changed, 630 insertions(+), 15 deletions(-)

-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
