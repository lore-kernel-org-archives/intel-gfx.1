Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7124C3DA79
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Jan 2024 19:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403E310E383;
	Mon, 15 Jan 2024 19:27:06 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C754610E383;
 Mon, 15 Jan 2024 19:27:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/xe/guc=3A_Enable?=
 =?utf-8?q?_WA_14018913170_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Date: Mon, 15 Jan 2024 19:27:04 -0000
Message-ID: <170534682481.479824.5975131054495975711@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240115185519.2246220-1-karthik.poosa@intel.com>
In-Reply-To: <20240115185519.2246220-1-karthik.poosa@intel.com>
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

== Series Details ==

Series: drm/xe/guc: Enable WA 14018913170 (rev2)
URL   : https://patchwork.freedesktop.org/series/128781/
State : warning

== Summary ==

Error: dim checkpatch failed
9e0d8f82fc08 drm/xe/guc: Enable WA 14018913170
-:42: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#42: FILE: drivers/gpu/drm/xe/xe_guc.c:178:
+			drm_warn(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %us %us %us\n",
+						version->major, version->minor, version->patch);

total: 0 errors, 0 warnings, 1 checks, 44 lines checked


