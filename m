Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC3606A693
	for <intel-gfx@archiver.kernel.org>; Sat, 21 Nov 2026 01:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3025288CFA;
	Sat, 21 Nov 2026 01:06:44 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC6C10E586;
 Sat, 21 Nov 2026 01:06:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_series_starting?=
 =?utf-8?q?_with_=5Bv3=2C1/4=5D_drm/i915/dp=3A_Drop_LSPCON_check_from_intel?=
 =?utf-8?q?=5Fdp=5Fhas=5Fgamut=5Fmetadata=5Fdip=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yitian Shao" <fighters390@qq.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sat, 21 Nov 2026 01:06:42 -0000
Message-ID: <179522320263.62696.10918880714765385788@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261121005409.17626-1-fighters390@qq.com>
In-Reply-To: <20261121005409.17626-1-fighters390@qq.com>
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
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: series starting with [v3,1/4] drm/i915/dp: Drop LSPCON check from intel_dp_has_gamut_metadata_dip()
URL   : https://patchwork.freedesktop.org/series/179260/
State : failure

== Summary ==

Series author address 'fighters390@qq.com' is not on the allowlist, which prevents CI from being automatically triggered.
If you want CI to run for this series, ask Patchwork project owners to click 'retest' on the series in Patchwork.
Exception occurred during validation, bailing out!
Build URL: http://gfx-ci.igk.intel.com:8080/job/CI_PW_kernel/193577/ (on built-in)


