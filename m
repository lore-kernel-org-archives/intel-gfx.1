Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC6AC43458
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Jul 2026 18:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C323110ECC3;
	Wed,  1 Jul 2026 18:07:57 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0714D10E3E3;
 Wed,  1 Jul 2026 18:07:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_fix=3A_drm/i915?=
 =?utf-8?q?=3A_=5F=5Flive=5Factive=5Fsetup=3A_kfree_bypasses_kref=5Fput_in_e?=
 =?utf-8?q?arly_error_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "WenTao Liang" <vulab@iscas.ac.cn>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 01 Jul 2026 18:07:57 -0000
Message-ID: <178292927702.139769.2997616029788948915@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260626132252.38377-1-vulab@iscas.ac.cn>
In-Reply-To: <20260626132252.38377-1-vulab@iscas.ac.cn>
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

Series: fix: drm/i915: __live_active_setup: kfree bypasses kref_put in early error path
URL   : https://patchwork.freedesktop.org/series/169611/
State : failure

== Summary ==

Series author address 'vulab@iscas.ac.cn' is not on the allowlist, which prevents CI from being automatically triggered.
If you want CI to run for this series, ask Patchwork project owners to click 'retest' on the series in Patchwork.
Exception occurred during validation, bailing out!
Build URL: http://gfx-ci.igk.intel.com:8080/job/CI_PW_kernel/180282/ (on built-in)


