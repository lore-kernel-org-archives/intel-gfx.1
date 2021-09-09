Return-Path: <SRS0=8Ejf=N7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0A7C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Sep 2021 01:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68A5F61167
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Sep 2021 01:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68A5F61167
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EBD6E418;
	Thu,  9 Sep 2021 01:53:33 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4ED6E418
 for <intel-gfx@lists.freedesktop.org>; Thu,  9 Sep 2021 01:53:32 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-Cytnt6crO4ymNmEuUXE-Ng-1; Wed, 08 Sep 2021 21:53:28 -0400
X-MC-Unique: Cytnt6crO4ymNmEuUXE-Ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34DB41006AA0;
 Thu,  9 Sep 2021 01:53:27 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 237D01A26A;
 Thu,  9 Sep 2021 01:53:25 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com
Date: Thu,  9 Sep 2021 11:52:59 +1000
Message-Id: <20210909015322.2988500-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Subject: [Intel-gfx] [PATCH 00/23] i915/display: split and constify vtable
 (v3)
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

(v3 just adds some missing ,)

      Details below, I've taken all the review feedback (thanks Jani).
I added 3 patches moving to wrappers before refactoring, and
one other patch is unreviewed (07) but the main comment was wanting
the wrappers.

Jani if you are happy with the final 4 patches can you land this
series, I don't think I have drm-intel commit rights.

v1:
This is orthogonal to my display ptr refactoring and should probably
be applied first.

The display funcs vtable was a bit of mess, lots of intermixing of
internal display functionality and interfaces to watermarks/irqs.

It's also considered not great security practice to leave writeable
function pointers around for exploits to get into.

This series attempts to address both problems, first there are a
few cleanups, then it splits the function table into multiple pieces.
Some of the splits might be bikesheds but I think we should apply first
and merge things later if there is good reason.

The second half converts all the vtables to static const structs,
I've used macros in some of them to make it less messy, the cdclk
one is probably the worst one.

v2:
Added some patches adding wrappers around things before refactoring
them as suggested by Jani.
Fixed up all struct names as suggested by Jani.
Added s-o-b lines
Added commit msgs.

v3:
added missing , (Jani)

Dave.


