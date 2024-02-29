Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5DAC5475B
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Feb 2024 01:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91CC10E1FE;
	Thu, 29 Feb 2024 01:18:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB48A10E1FE;
 Thu, 29 Feb 2024 01:18:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Enable_MST_bigjoiner?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vidya Srinivas" <vidya.srinivas@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 29 Feb 2024 01:18:40 -0000
Message-ID: <170916952076.375728.4126225319915757912@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228150436.6957-1-vidya.srinivas@intel.com>
In-Reply-To: <20240228150436.6957-1-vidya.srinivas@intel.com>
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

Series: Enable MST bigjoiner (rev2)
URL   : https://patchwork.freedesktop.org/series/130449/
State : warning

== Summary ==

Error: dim checkpatch failed
1b60bcd2953c drm/i915: Allow bigjoiner for MST
-:15: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Manasi Navare <navaremanasi@chromium.org)'
#15: 
Acked-by: Manasi Navare <navaremanasi@chromium.org)

total: 1 errors, 0 warnings, 0 checks, 48 lines checked


