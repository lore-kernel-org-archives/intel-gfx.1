Return-Path: <SRS0=3jid=FE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3CFC63777
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 15:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E36162076C
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Nov 2020 15:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E36162076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D93F6E529;
	Mon, 30 Nov 2020 15:33:14 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F84B6E520;
 Mon, 30 Nov 2020 15:33:12 +0000 (UTC)
IronPort-SDR: CrhOzpJ6Nm2ptsxcSGaMr2sfx49nYv1sUWSQ2JogO9dPltZLyPRkL4G6UzB+eNsqoqMzxeF+Yo
 zm835GhMCW4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="172755191"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="172755191"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 07:33:11 -0800
IronPort-SDR: Jq1AKKxoXAEAwnC9KuPFZgFTsqjG4klRDNPLrvRVXkfGYWkwZHv3N8Gnq79Wg+JJI4bF2S/jBZ
 JxtxMGQH2PeQ==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="549143479"
Received: from cshanno1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.44])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 07:33:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Mon, 30 Nov 2020 17:33:05 +0200
Message-ID: <87sg8qkgge.fsf@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [ANNOUNCE] upcoming mandated dim upgrade due to
 drm-intel branch change
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


TL;DR:
- On 2020-12-05, drm-intel-next-queued will be decommissioned
- drm-intel committers need to start using drm-intel-next instead
- Everyone needs to upgrade dim *after* the change


Full story:

For historical reasons, we've had separate drm-intel-next-queued
("dinq") and drm-intel-next ("din") branches for development and pull
requests, respectively. This split has not been necessary for a while
now, so we'll finally remove dinq, and start applying patches directly
to drm-intel-next.

We'll make the switch on 2020-12-05.

This change requires a flag-day change in dim, i.e. everyone will need
to upgrade dim *after* the switch. (The details of the flag-day change
are covered in [1].)

All the current dinq related commands and aliases (such as 'dim conq',
'dim aq', and 'dim pq') will continue to work, except they'll operate on
drm-intel-next.


BR,
Jani.


[1] http://marc.info/?i=20201113095658.16655-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
