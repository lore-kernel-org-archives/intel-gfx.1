Return-Path: <SRS0=n/yo=IT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PLING_QUERY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B787C433E0
	for <intel-gfx@archiver.kernel.org>; Sun, 21 Mar 2021 12:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7DB61939
	for <intel-gfx@archiver.kernel.org>; Sun, 21 Mar 2021 12:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B7DB61939
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m3y3r.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D181F6E1D8;
	Sun, 21 Mar 2021 12:08:13 +0000 (UTC)
X-Greylist: delayed 1424 seconds by postgrey-1.36 at gabe;
 Sun, 21 Mar 2021 12:08:12 UTC
Received: from www17.your-server.de (www17.your-server.de [213.133.104.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57C16E1D8
 for <intel-gfx@lists.freedesktop.org>; Sun, 21 Mar 2021 12:08:12 +0000 (UTC)
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www17.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <thomas@m3y3r.de>) id 1lNwVO-000B6u-5V
 for intel-gfx@lists.freedesktop.org; Sun, 21 Mar 2021 12:44:26 +0100
Received: from [2a02:908:4c22:ec00:1ecf:d1b7:80b:9a65]
 (helo=localhost.localdomain)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <thomas@m3y3r.de>) id 1lNwVO-000G0c-0l
 for intel-gfx@lists.freedesktop.org; Sun, 21 Mar 2021 12:44:26 +0100
Date: Sun, 21 Mar 2021 12:44:24 +0100
From: Thomas Meyer <thomas@m3y3r.de>
To: intel-gfx@lists.freedesktop.org
Message-ID: <YFcw+c4dWmPejkKo@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Authenticated-Sender: thomas@m3y3r.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26115/Sat Mar 20 12:03:55 2021)
Subject: [Intel-gfx] i915: v5.10.23: kernel hangs at boot when external
 monitor is connected?!
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

Hi,

when booting with an external monitor connected the boot process seems to stop
in the kernel. No additional output is show, it just hangs.

kernel is 5.10.23 and driver is i915. When unplugging and reset computer, the
system starts normal. Any ideas what could be the culprit and what to enable
in kernel config to get a bit more insight what's probably going on?

mfg
thomas
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
