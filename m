Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDF6C48BF6
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Mar 2024 03:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DD710F0AF;
	Tue,  5 Mar 2024 03:02:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB6A10F011;
 Tue,  5 Mar 2024 03:02:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5Bv?=
 =?utf-8?q?8=2C1/3=5D_drm/buddy=3A_Implement_tracking_clear_page_feature?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 05 Mar 2024 03:02:29 -0000
Message-ID: <170960774989.522830.3983416433401591536@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304163220.3093-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20240304163220.3093-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: series starting with [v8,1/3] drm/buddy: Implement tracking clear page feature
URL   : https://patchwork.freedesktop.org/series/130680/
State : failure

== Summary ==

Error: make failed
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  AR      drivers/gpu/drm/panel/built-in.a
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  AR      drivers/gpu/drm/bridge/built-in.a
  AR      drivers/gpu/drm/hisilicon/built-in.a
  AR      drivers/gpu/drm/mxsfb/built-in.a
  AR      drivers/gpu/drm/tiny/built-in.a
  AR      drivers/gpu/drm/xlnx/built-in.a
  AR      drivers/gpu/drm/gud/built-in.a
  AR      drivers/gpu/drm/solomon/built-in.a
  CC [M]  drivers/gpu/drm/tests/drm_buddy_test.o
drivers/gpu/drm/tests/drm_buddy_test.c: In function ‘drm_test_buddy_alloc_range_bias’:
drivers/gpu/drm/tests/drm_buddy_test.c:106:3: error: too few arguments to function ‘drm_buddy_free_list’
  106 |   drm_buddy_free_list(&mm, &tmp);
      |   ^~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/tests/drm_buddy_test.c:13:
./include/drm/drm_buddy.h:166:6: note: declared here
  166 | void drm_buddy_free_list(struct drm_buddy *mm,
      |      ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/tests/drm_buddy_test.c:116:3: error: too few arguments to function ‘drm_buddy_free_list’
  116 |   drm_buddy_free_list(&mm, &tmp);
      |   ^~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/tests/drm_buddy_test.c:13:
./include/drm/drm_buddy.h:166:6: note: declared here
  166 | void drm_buddy_free_list(struct drm_buddy *mm,
      |      ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/tests/drm_buddy_test.c:156:4: error: too few arguments to function ‘drm_buddy_free_list’
  156 |    drm_buddy_free_list(&mm, &tmp);
      |    ^~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/tests/drm_buddy_test.c:13:
./include/drm/drm_buddy.h:166:6: note: declared here
  166 | void drm_buddy_free_list(struct drm_buddy *mm,
      |      ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/tests/drm_buddy_test.c:163:2: error: too few arguments to function ‘drm_buddy_free_list’
  163 |  drm_buddy_free_list(&mm, &allocated);
      |  ^~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/tests/drm_buddy_test.c:13:
./include/drm/drm_buddy.h:166:6: note: declared here
  166 | void drm_buddy_free_list(struct drm_buddy *mm,
      |      ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/tests/drm_buddy_test.c:223:2: error: too few arguments to function ‘drm_buddy_free_list’
  223 |  drm_buddy_free_list(&mm, &allocated);
      |  ^~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/tests/drm_buddy_test.c:13:
./include/drm/drm_buddy.h:166:6: note: declared here
  166 | void drm_buddy_free_list(struct drm_buddy *mm,
      |      ^~~~~~~~~~~~~~~~~~~
make[6]: *** [scripts/Makefile.build:243: drivers/gpu/drm/tests/drm_buddy_test.o] Error 1
make[5]: *** [scripts/Makefile.build:481: drivers/gpu/drm/tests] Error 2
make[4]: *** [scripts/Makefile.build:481: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:481: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:481: drivers] Error 2
make[1]: *** [/home/kbuild2/kernel/Makefile:1921: .] Error 2
make: *** [Makefile:240: __sub-make] Error 2
Build failed, no error log produced


