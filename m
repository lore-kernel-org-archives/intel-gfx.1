Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF5760A260E
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2026 13:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646D610EDAD;
	Mon,  2 Nov 2026 13:01:56 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C810410EDA9;
 Mon,  2 Nov 2026 13:01:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_series_starting?=
 =?utf-8?q?_with_=5B1/1=5D_PM=3A_runtime=3A_change_stub_pm=5Fruntime=5Fget?=
 =?utf-8?q?=5Fif=5Factive=28=29_return_1_when_!CONFIG=5FPM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: frank.li@oss.nxp.com
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 02 Nov 2026 13:01:55 -0000
Message-ID: <179362451580.102798.18445634149127066042@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
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

Series: series starting with [1/1] PM: runtime: change stub pm_runtime_get_if_active() return 1 when !CONFIG_PM
URL   : https://patchwork.freedesktop.org/series/177450/
State : failure

== Summary ==

Series author address 'frank.li@oss.nxp.com' is not on the allowlist, which prevents CI from being automatically triggered.
If you want CI to run for this series, ask Patchwork project owners to click 'retest' on the series in Patchwork.
Exception occurred during validation, bailing out!
Build URL: http://gfx-ci.igk.intel.com:8080/job/CI_PW_kernel/191952/ (on built-in)


